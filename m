Content-Type: multipart/mixed; boundary="===============7907719397790330693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.8/muqss 1/24] kernel/sched/MuQSS.c:5127:9: warning: Variable 'retval' is reassigned a value before the old one has been used.
Date: Sun, 23 Aug 2020 06:30:39 +0800
Message-ID: <202008230637.iJ1EiQ2z%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7907719397790330693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Con Kolivas <kernel@kolivas.org>
CC: Steven Barrett <steven@liquorix.net>

tree:   https://github.com/zen-kernel/zen-kernel 5.8/muqss
head:   db04c0928ec2c38291ffb330ee4ce8217c73f069
commit: a7fe15e65f195714f080517f5a81303badc46dd9 [1/24] MultiQueue Skiplist=
 Scheduler v0.202
:::::: branch date: 2 hours ago
:::::: commit date: 13 days ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/sched/MuQSS.c:5127:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5122:0: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    int retval =3D -EINVAL;
   ^
   kernel/sched/MuQSS.c:5127:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5160:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5153:0: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    int retval =3D -EINVAL;
   ^
   kernel/sched/MuQSS.c:5160:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5164:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5160:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5164:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5248:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5244:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5248:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5307:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D security_task_setscheduler(p);
           ^
   kernel/sched/MuQSS.c:5297:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -EPERM;
           ^
   kernel/sched/MuQSS.c:5307:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D security_task_setscheduler(p);
           ^
   kernel/sched/MuQSS.c:5387:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5382:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5387:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5729:9: warning: Variable 'retval' is reassigned a =
value before the old one has been used. [redundantAssignment]
    retval =3D security_task_getscheduler(p);
           ^
   kernel/sched/MuQSS.c:5723:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D -ESRCH;
           ^
   kernel/sched/MuQSS.c:5729:9: note: Variable 'retval' is reassigned a val=
ue before the old one has been used.
    retval =3D security_task_getscheduler(p);
           ^
>> kernel/sched/MuQSS.c:4794:18: warning: Local variable rlim_rtprio shadow=
s outer variable [shadowVar]
      unsigned long rlim_rtprio =3D
                    ^
   kernel/sched/MuQSS.c:4736:16: note: Shadowed declaration
    unsigned long rlim_rtprio =3D 0;
                  ^
   kernel/sched/MuQSS.c:4794:18: note: Shadow variable
      unsigned long rlim_rtprio =3D
                    ^
   kernel/sched/MuQSS.c:2062:6: warning: Variable 'cpu' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    cpu =3D select_best_cpu(p);
        ^
   kernel/sched/MuQSS.c:1995:6: note: Variable 'cpu' is reassigned a value =
before the old one has been used.
    cpu =3D task_cpu(p);
        ^
   kernel/sched/MuQSS.c:2062:6: note: Variable 'cpu' is reassigned a value =
before the old one has been used.
    cpu =3D select_best_cpu(p);
        ^

# https://github.com/zen-kernel/zen-kernel/commit/a7fe15e65f195714f080517f5=
a81303badc46dd9
git remote add zen-kernel-zen-kernel https://github.com/zen-kernel/zen-kern=
el
git fetch --no-tags zen-kernel-zen-kernel 5.8/muqss
git checkout a7fe15e65f195714f080517f5a81303badc46dd9
vim +/retval +5127 kernel/sched/MuQSS.c

a7fe15e65f1957 Con Kolivas 2019-10-25  5111  =

a7fe15e65f1957 Con Kolivas 2019-10-25  5112  /**
a7fe15e65f1957 Con Kolivas 2019-10-25  5113   * sys_sched_getscheduler - ge=
t the policy (scheduling class) of a thread
a7fe15e65f1957 Con Kolivas 2019-10-25  5114   * @pid: the pid in question.
a7fe15e65f1957 Con Kolivas 2019-10-25  5115   *
a7fe15e65f1957 Con Kolivas 2019-10-25  5116   * Return: On success, the pol=
icy of the thread. Otherwise, a negative error
a7fe15e65f1957 Con Kolivas 2019-10-25  5117   * code.
a7fe15e65f1957 Con Kolivas 2019-10-25  5118   */
a7fe15e65f1957 Con Kolivas 2019-10-25  5119  SYSCALL_DEFINE1(sched_getsched=
uler, pid_t, pid)
a7fe15e65f1957 Con Kolivas 2019-10-25  5120  {
a7fe15e65f1957 Con Kolivas 2019-10-25  5121  	struct task_struct *p;
a7fe15e65f1957 Con Kolivas 2019-10-25  5122  	int retval =3D -EINVAL;
a7fe15e65f1957 Con Kolivas 2019-10-25  5123  =

a7fe15e65f1957 Con Kolivas 2019-10-25  5124  	if (pid < 0)
a7fe15e65f1957 Con Kolivas 2019-10-25  5125  		goto out_nounlock;
a7fe15e65f1957 Con Kolivas 2019-10-25  5126  =

a7fe15e65f1957 Con Kolivas 2019-10-25 @5127  	retval =3D -ESRCH;
a7fe15e65f1957 Con Kolivas 2019-10-25  5128  	rcu_read_lock();
a7fe15e65f1957 Con Kolivas 2019-10-25  5129  	p =3D find_process_by_pid(pid=
);
a7fe15e65f1957 Con Kolivas 2019-10-25  5130  	if (p) {
a7fe15e65f1957 Con Kolivas 2019-10-25  5131  		retval =3D security_task_get=
scheduler(p);
a7fe15e65f1957 Con Kolivas 2019-10-25  5132  		if (!retval)
a7fe15e65f1957 Con Kolivas 2019-10-25  5133  			retval =3D p->policy;
a7fe15e65f1957 Con Kolivas 2019-10-25  5134  	}
a7fe15e65f1957 Con Kolivas 2019-10-25  5135  	rcu_read_unlock();
a7fe15e65f1957 Con Kolivas 2019-10-25  5136  =

a7fe15e65f1957 Con Kolivas 2019-10-25  5137  out_nounlock:
a7fe15e65f1957 Con Kolivas 2019-10-25  5138  	return retval;
a7fe15e65f1957 Con Kolivas 2019-10-25  5139  }
a7fe15e65f1957 Con Kolivas 2019-10-25  5140  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7907719397790330693==--

