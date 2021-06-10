resource "aws_iam_role_policy" "s3_access_policy" {
  name = "s3_access_policy"
  role = "${aws_iam_role.ec2_role.id}"
  policy = "${file(s3_access_policy.json)}"
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = "${file(ec2_role.json)}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "test_profile"
  role = "${aws_iam_role.ec2_role.id}"
}
