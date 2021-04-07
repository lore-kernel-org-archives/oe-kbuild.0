Content-Type: multipart/mixed; boundary="===============1429172077817008679=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trace:ftrace/eventfs 29/31] fs/tracefs/event_inode.c:203:24: warning: Unused variable: ti [unusedVariable]
Date: Thu, 08 Apr 2021 04:54:27 +0800
Message-ID: <202104080420.nbRvy4CR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1429172077817008679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git ftrace/eventfs
head:   98c5aabb161e22a877a91272fb99f8a1e9d9e784
commit: 257ae215118381ba942287c5fc7edf81336bc5d5 [29/31] Fixes to make it c=
ompile
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: xtensa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/tracefs/event_inode.c:203:24: warning: Unused variable: ti [unusedVar=
iable]
    struct tracefs_inode *ti;
                          ^
>> fs/tracefs/event_inode.c:204:24: warning: Unused variable: ei [unusedVar=
iable]
    struct eventfs_inode *ei;
                          ^
>> fs/tracefs/event_inode.c:205:23: warning: Unused variable: ef [unusedVar=
iable]
    struct eventfs_file *ef, *n;
                         ^
>> fs/tracefs/event_inode.c:205:28: warning: Unused variable: n [unusedVari=
able]
    struct eventfs_file *ef, *n;
                              ^

vim +203 fs/tracefs/event_inode.c

fa0d07bef48a9a Ajay Kaher 2021-01-31  202  =

fa0d07bef48a9a Ajay Kaher 2021-01-31 @203  	struct tracefs_inode *ti;
fa0d07bef48a9a Ajay Kaher 2021-01-31 @204  	struct eventfs_inode *ei;
fa0d07bef48a9a Ajay Kaher 2021-01-31 @205  	struct eventfs_file *ef, *n;
fa0d07bef48a9a Ajay Kaher 2021-01-31  206  	struct inode *inode =3D file_in=
ode(file);
fa0d07bef48a9a Ajay Kaher 2021-01-31  207  	struct dentry *dentry =3D file_=
dentry(file);
fa0d07bef48a9a Ajay Kaher 2021-01-31  208  =

02514bdd3c4be7 Ajay Kaher 2021-03-16  209  	printk("%s:%d dir =3D %s\n", __=
func__, __LINE__, dentry->d_iname);
02514bdd3c4be7 Ajay Kaher 2021-03-16  210  =


:::::: The code at line 203 was first introduced by commit
:::::: fa0d07bef48a9aeb131618523c09d9ae154154c2 tracefs: Add eventfs for ev=
ents

:::::: TO: Ajay Kaher <akaher@vmware.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1429172077817008679==--

