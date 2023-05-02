#create s3 for storing db files
resource "aws_s3_bucket" "mybuck9955statelock" {
  bucket = "mybuck9955statelock"
  versioning {
    enabled = true
  }


}

resource "aws_s3_bucket_server_side_encryption_configuration" "ex-sse" {
  bucket = aws_s3_bucket.mybuck9955statelock.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#create dynamo db for state locking to avoid corruption/change of state file
resource "aws_dynamodb_table" "statelock-table" {
  name         = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S" #S->String,N->Number,B->Binary
  }
}
