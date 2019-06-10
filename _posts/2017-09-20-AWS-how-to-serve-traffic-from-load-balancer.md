---
layout: post
categories:
- sysadmin
date: 2017-09-20T00:00:00Z
title: AWS - How to Serve Traffic from a Load Balancer
url: /2017/09/20/AWS-how-to-serve-traffic-from-load-balancer/
---

[Amazon Web Services](http://aws.amazon.com) (AWS) allows you to serve private network traffic from behind a public load balancer. This offers extra security benefits as it detects DDOS traffic and other exploits and offers a layer of protection.

There are some things you should know before you start this tutorial. You should know:

1. How to create a [VPC](https://en.wikipedia.org/wiki/Virtual_private_cloud)
1. How to configure [subnets](https://en.wikipedia.org/wiki/Subnetwork)
1. How to create an EC2 instance
1. How to ensure an EC2 instance is within an particular subnet
1. How to ssh to an EC2 instance

You will create a new VPC. You can use your default VPC, but this isn't recommended. Default VPCs are for legacy ec2-classic instances. You should identify a CIDR block range for your VPC (e.g. 10.0.0.0/16). 

Then, create two new subnets under the new VPC. One will be private and one will be public. The load balancer will use the public subnet and the EC2 instance will use the private subnet. Each subnet will have a different route table, one allowing traffic in and the other not. The first subnet should have a CIDR block range of 10.0.1.0/24. Next create your private subnet with a CIDR of 10.0.2.0/24 - this can be in the same availibility zone as the first subnet.

For high availability, it is a good idea to place your next elastic load balancer in a different availability zone. When you configure your load balancer you will need to choose two subnets. Therefore we have to create another public subnet that has a different availability zone. This has a CIDR range of 10.0.3.0/24 and is belongs in a different availability zone.

You should have three subnets as this image shows.


<blockquote class="imgur-embed-pub" lang="en" data-id="a/KFrjH"><a href="//imgur.com/KFrjH"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

Next you need to create an Internet Gateway and attach it to the public subnet. This is what makes the load balancer  world accessible. Click on Internet Gateway, then create an internet gateway, with a name tag. Then, attach it to the VPC that you have created (only one Internet Gateway can be attached to a VPC). Click the Attach to VPC button and then choose the new VPC that you created earlier. This means you will be able to access the EC2 instance for the time being.

Next add a route table. Create a Route Table and add a route of 0.0.0.0/0 and choose the target of your new Internet Gateway. This means you can now access your EC2 instance. 

This route table is associated with all of the subnets, which means they are all now public. We will later make the private subnet private.

Now, create your EC2 instance. Launch it in the private subnet (even though it is still public at the moment).

When you create your EC2 instance create a rule that allows port 80 for HTTP.

Now create a load balancer. This will be a classic type of load balancer. Do not create an internal load balancer, as that will only be accessible from within the VPC. We want traffic from anywhere. Listen on port 80. Now we select the two public subnets that we created earlier. One of them has to be in the same availability zone as the EC2 instance (which it is). The other one can be in a different availibility zone. Assign the security group that was created when you created the VPC.

With load balancers you have to configure the health check. This is best done over TCP protocol on port 22. Then you add an EC2 instance to the load balancer. Use the one that we created earlier. Add tags, review and launch.

Now we need to SSH in to the instance and install a httpd server. ssh in using your key, ssh -i pem-key.pem ec2-user@34.3.124.41 - do not forget that your pem key file must have permissions of 400 or less.

Start the httpd service - sudo service start httpd

Check using the public ip address of the EC2 instance. You'll notice that this works as the EC2 instance is still in a public route table.

Let's fix that by creating a new route table. The new route table must only have a route that allows the local traffic (i.e. no 0.0.0.0/0). Then go to the private subnet and then change the route for the subnet to the new route table that doesn't have a public route.

<blockquote class="imgur-embed-pub" lang="en" data-id="a/CzkdB"><a href="//imgur.com/CzkdB"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

You can test if your load balancer is still forwarding the traffic by clicking on load balancer link, selecting the active load balancer and then using the DNS information

<blockquote class="imgur-embed-pub" lang="en" data-id="a/mPIkP"><a href="//imgur.com/mPIkP"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

Copy and paste that link into your browser. You should be forwarded to the HTTP welcome page that the private EC2 instance is server.

If you have any comments, please post them in the disqus below. 
