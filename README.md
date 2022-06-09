# Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.


![Network Diagram](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Project%201%20Network%20Diagram.png "Network Diagram")


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible file may be used to install only certain pieces of it, such as Filebeat.



List of Playbook File

1. [ansible.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/Ansible.yml)
2. [install-elk.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/install-elk.yml)
3. [filebeat-config.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/filebeat-config.yml)
4. [filebeat-playbook.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/filebeat-playbook.yml)
5. [metricbeat-config.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/metricbeat-config.yml)
6. [metricbeat-playbook.yml](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Ansible%20YAML/metricbeat-playbook.yml)



This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


## Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

### Aspect of Load Balancer

-Load balancer defends a Distributed Denial Of Service (DDOS) attack
-Load balancing is the process of distributing newtork traffic across multiple servers
-Load balancing is improves application responsiveness and increases availability of appications

### Advamtage of Jump Box

-Jump Box is a system on a network used to access and manage devices in a separate security zone.
-It is segregating administrator access
-Jump Box is an excellent out-of-band (OOB) remote access method for system administrators.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

### Filebeat
- What does Filebeat watch for?
-- Filebeat helps generated and organize log files to send to Logstash and Elasticsearch. All log files from very specific such as those generated by Apache, Microsoft Azure tools, Nginx Web Server and Mysql dtabases.

- What does Metricbeat record?
-- Metricbeat records metrics from the Operating system and services running on the server. By using Elasticsearch or Logstash, you can visualize the metrics and statistics that Metricbeat generates from the OS and running services.

The configuration details of each machine may be found below.

Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table.

             

|Number   	|Name   				| Function        				|IP Address   						| Operting System		|
|-----------|-----------------------------|-----------------------------------------|-----------------------------------------------|----------------------	|
|   1.	| Jump-Box-Provisioner		| Administrator; Docker with Ansible	| Private: 10.1.0.4; Public 20.92.232.35		|  Linux (ubuntu 18.04)	|
|   2.	| Red-Web-Team1 		  	| Server with DVWA application		|   10.1.0.5						|  Linux (ubuntu 18.04) |
|   3.	| Red-Web-Team2			| Server with DVWA application 		|   10.1.0.7						|  Linux (ubuntu 18.04)	|
|   4.	| ELK Server  			| Run Filebeat and Metricbeat and Kabana	| Private: 10.2.0.4; Public 20.222.21.187  	|  Linux (ubuntu ) 	|
|   5.	| Work Station  			| SSH and Host Terminal				| Public 120.17.159.98 					|  Windows 11Pro  	|


## Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisoner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Add whitelisted IP addresses 120.17.159.98

Machines within the network can only be accessed by Jump-Box-Provisioner.
- Jump-Box-Provisioner machine did you allow to access your ELK VM? What was its IP address? Public IP 20.92.232.35/Private: 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name     		 		| Publicly Accessible | Allowed IP Addresses |
|-----------------------------|---------------------|----------------------|
| Jump-Box-Provisioner	      | Yes/ SSH 22         | 120.17.159.98        |
| Red-Web-Team1		      | No                  | 20.92.232.35         |
| Red-Web-Team2    	      | No                  | 20.92.232.35         |
| Red-Web-Team1		      | No                  | 20.92.85.81          |
| Red-Web-Team2    	      | No                  | 20.92.85.81          |
| RedTeam-LoadBalancer	      | Yes                 | 120.17.159.98        |
| ELK Server  	            | Yes-Port 5601       | 120.17.159.98        |
| ELK Server  	            | No                  | 20.92.232.35         |


## Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

- Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration managment, application deployment and many other IT needs.

The playbook implements the following tasks:

- Download and configure a container -elk-docker

- Launch and expose the container

- Implement identity and access management


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Screenshot of docker ps output](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/docker_ps_output.png)
![Installation of ELK.yml file](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/install-elk.yml-image.jpg)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
	###List the IP addresses of the machines you are monitoring

		*1. 10.1.0.5
		*2. 10.1.0.7
		*3. 10.2.0.4

We have installed the following Beats on these machines:

- Filebeat
	![Installation Filebeat yml file](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/filebeat-playbook.yml.png)
- Metricbeat
	![Installation Metricbeat yml file](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/metricbeat-playbook.yml.png)



These Beats allow us to collect the following information from each machine:

- Filebeat collect system log, audit logs server logs from the server.

	![Exmaple of Filebeat data through Kabana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Dashboard-Filebeat.png)

- Metricbeat-collect metrics and statistics of server.
	
	![Exmaple of Metricbeat data through Kabana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Metric-dashboard.png)


## Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the playbook file to Ansible Vms .
- Update the hosts file to include web server and elk server
- Run the playbook, and navigate to Kabana to check that the installation worked as expected.

    ![Kabana Screen](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Kibana%20Homepage.png)

- Which file is the playbook? Where do you copy it?

	1. Copy ansible.yml and install-elk.yml playbook files into Jump-Box-Provisioner (VM) on /etc/ansible directory
	
	![ScreenShot of playbook files in Ansible Container](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Playbook%20of%20anisble%20and%20install-elk.png)
	
	2. Copy filebeat-config.yml and metricbeat-config.yml playbook files into Jump-Box-Provisioner (VM) on /etc/ansible/files directory

	![ScreenShot of playbook files in Ansible Container](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Playbook%20of%20Filebeat-config%20and%20Metricbeat-config.png)
	
	3. Copy filebeat-playbook.yml and metricbeat-playbook.yml playbook files into Jump-Box-Provisioner (VM) on /etc/ansible/roles directory

	![ScreenShot of playbook files in Ansible Container](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Playbook%20of%20Filebeat-playbook%20and%20Metricbeat-playbook.png)

- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

	Hosts and ansible.cfg file need to update with server ip address and remote_user dtatils as follows.
	
	![Hosts File configuration](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Ansible-Host-file.png)
	
	![Ansible.cfg File configuration](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Ansible-Host-file.png)


- Which URL do you navigate to in order to check that the ELK server is running?

	- Navigate to http://[your.VM.IP]:5601/app/kibana. Use the public IP address of the ELK server that you created.(For example my ELK Server IP address: 20.222.21.187)

	- Click 'Explore on my Own'
	
	![Kibana Screenshot](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Images/Kibana%20Images/Kibana%20Homepage.png)

	![Filebeat Status-Kibana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Images/Kibana%20Images/Filebeat-Status-Kibana.png)
	
	![Metricbeat Staus-Kibana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Images/Kibana%20Images/Metricbeat%20docker%20status.png)

	![Filebeat Dashboard Screen-Kibana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Images/Kibana%20Images/Dashboard-Filebeat.png)
	
	![Metricbeat Dashboard Screen-Kibana](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Images/Kibana%20Images/Metricbeat-dashboard%20result.png)
	
	
	BONUS Commands
	
	-Downlad playbook through Curl command
	![Curl-Command](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/Curl%20for%20download%20file.png)
	
	-Update file through Nano Command
	![Nano Command](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/nano%20for%20playbook%20update%20or%20editing.png)

	-Run Playbook Command through ansible-playbook
	![Playbook Command](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/filebeat-playbook.yml.png)

	-Docker ps Command
	![Docker ps command](https://github.com/cyberebyc/ELK-Stack-Project/blob/main/Network%20Diagram/docker_ps_output.png)

	-Git bash Command 
		-git clone https://github.com/

		-cd OneDrive/Documents/GitHub/ELK-Stack-Project/

		-git pull

		-git add README.md

		-git commit -m "Readme file updated V1"

		-git push

	



	
	


