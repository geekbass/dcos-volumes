resource "aws_ebs_volume" "mesos" {
  count             = "${var.num}"
  availability_zone = "${element(var.availability_zone, count.index + 0)}"
  type              = "${var.disk_type}"
  size              = "${var.mesos_size}"
}

resource "aws_volume_attachment" "mesos_attach" {
  count       = "${var.num}"
  device_name = "/dev/xvde"
  volume_id   = "${element(aws_ebs_volume.mesos.*.id, count.index + 0)}"
  instance_id = "${element(var.instance_id, count.index + 0)}"
}

resource "aws_ebs_volume" "docker" {
  count             = "${var.num}"
  availability_zone = "${element(var.availability_zone, count.index + 0)}"
  type              = "${var.disk_type}"
  size              = "${var.docker_size}"
}

resource "aws_volume_attachment" "docker_attach" {
  count       = "${var.num}"
  device_name = "/dev/xvdf"
  volume_id   = "${element(aws_ebs_volume.docker.*.id, count.index + 0)}"
  instance_id = "${element(var.instance_id, count.index + 0)}"
}

resource "aws_ebs_volume" "volume0" {
  count             = "${var.num}"
  availability_zone = "${element(var.availability_zone, count.index + 0)}"
  type              = "${var.disk_type}"
  size              = "${var.extra_volume_size}"
}

resource "aws_volume_attachment" "volume0_attach" {
  count       = "${var.num}"
  device_name = "/dev/xvdg"
  volume_id   = "${element(aws_ebs_volume.volume0.*.id, count.index + 0)}"
  instance_id = "${element(var.instance_id, count.index + 0)}"
}

resource "aws_ebs_volume" "log" {
  count             = "${var.num}"
  availability_zone = "${element(var.availability_zone, count.index + 0)}"
  type              = "${var.disk_type}"
  size              = "${var.log_size}"
}

resource "aws_volume_attachment" "log_attach" {
  count       = "${var.num}"
  device_name = "/dev/xvdh"
  volume_id   = "${element(aws_ebs_volume.log.*.id, count.index + 0)}"
  instance_id = "${element(var.instance_id, count.index + 0)}"
}
