AWS DC/OS Additional EBS Volumes and Attachments (NOTE: THIS IS CURRENTLY EXPERIMENTAL AND NOT YET SUPPORTED)
===========
This module creates additional ebs volumes and attaches them to the instances. This is based on best practices for DC/OS.

EXAMPLE
-------

```hcl
module "agent_volumes" {
 source = "/Users/westonbassler/Documents/git-repos/dcos-volumes"
 num                     = "${var.agent_instance_count}"
 instance_id             = "${module.agent.instances}"
 availability_zone       = "${var.azs_main}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zone | AZ(s) of where to create the Volumes | list | - | yes |
| disk_type | Type of disk | string | `gp2` | no |
| docker_size | Size of the /var/lib/docker disk | string | `100` | no |
| extra_volume_size | Size of an extra Volume | string | `50` | no |
| instance_id | The instance ID to attach the disks to | list | - | yes |
| log_size | Size of the /var/log disk | string | `500` | no |
| mesos_size | Size of the /var/lib/mesos disk | string | `250` | no |
| num | Number of Instances | string | `1` | no |

