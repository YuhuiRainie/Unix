#!/usr/bin/perl
## main function
our @argument = qw(-a -m -t -s -n);


if (checkArgument() == 1){
  if ($ARGV[0] eq '-a'){
    checkIfFileExsit();
    displaySortedString();
  }
   if ($ARGV[0] eq '-m'){
     checkIfFileExsit();
    displayTotalMemorySize();
  }
   if ($ARGV[0] eq '-t'){
     checkIfFileExsit();
    displayCPUseconds();
  }
   if ($ARGV[0] eq '-n'){
     checkIfFileExsit();
    displayMyname();
  }
  if ($ARGV[0] eq '-s'){
    open (INFILE, $ARGV[2]);
    if (! -e $ARGV[2]){
    print "file is not exsits!\n";
    exit;
  }
  elsif (! -r $ARGV[2]){
    print "file is not readable!\n";
    exit;
  }
  elsif (! -s $ARGV[2]){
    print "File is empty \n";
    exit;
  }
    displayMemoryMeetThreshold();
  }
}
elsif(checkArgument() == 0){
print "displaytasks.pl @ARGV\n";
}

# #########################
# functions below
sub checkArgument{
  my $bool = 0;
  foreach my $argument (@argument){
     if($ARGV[0] eq $argument){
       $bool = 1;
     }  
  }
  
  return $bool;
}

sub checkIfFileExsit{
   open (INFILE, $ARGV[1]);
  if (! -e $ARGV[1]){
    print "file is not exsits!\n";
    exit;
  }
  elsif (! -r $ARGV[1]){
    print "file is not readable!\n";
    exit;
  }
}

sub checkIfFileEmpty{
  my $ifFileEmptyBool = 1;
  if(-s $ARGV[1]){
    $ifFileEmptyBool = 0;
  }
  return $ifFileEmptyBool;
}

sub displaySortedString{
  my  %my_hash;
if(checkIfFileEmpty == 0){
while( my $row = <INFILE>)

{
     chomp;
     my @filds = split / /, $row;
      $my_hash{$filds[3]} = ("$filds[0] $filds[1] $filds[2]");  
          
}

 foreach my $key (sort keys %my_hash)

       {

         print $my_hash{$key} ." ". $key  ;
          
           }
}
else{
  print "No task found!\n";
  
}

}

sub displayTotalMemorySize{
  if(checkIfFileEmpty == 0){
  my @memorySize;
  my $totalMemory = 0; 
while( my $row = <INFILE>)

{
     chomp;
     my @filds = split / /, $row;
      push (@memorySize,$filds[1]);
          
}
foreach my $memory (@memorySize){
  $totalMemory += $memory;
}
print "Total memory size: $totalMemory KB \n";
}
else{
  print "No memory used\n";
  
}
}

sub displayCPUseconds{
  if(checkIfFileEmpty == 0){
  my @cpuSeconds;
  my $totalCPUseconds = 0; 
while( my $row = <INFILE>)

{
     chomp;
     my @filds = split / /, $row;
      push (@cpuSeconds,$filds[2]);
          
}
foreach my $seconds (@cpuSeconds){
  $totalCPUseconds += $seconds;
}
print "Total CPU seconds: $totalCPUseconds seconds \n";
}
else{
  print "No CPU time used\n";
  
}
}
sub displayMemoryMeetThreshold{
  my $ifHasMemoryMeetThreshold = 0;
while (my $row = <INFILE>)
{
     chomp;
     my @filds = split / /, $row;
     if ($filds[1] >= $ARGV[1]){
       $ifHasMemoryMeetThreshold = 1;
       print "$filds[0] $filds[1] $filds[2] $filds[3]";
     }

}
if ($ifHasMemoryMeetThreshold == 0){
  print "No tasks with the specified memory size \n";
}


}
sub displayMyname{
  print "Name: Yuhui Liu\n";
  print "Student ID:12842201\n";
  print "Finished date: 28th May 2019\n";
}