Content-Type: multipart/mixed; boundary="===============1291723298319196916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sched/core_sched.c:175 sched_core_share_pid() warn: ignoring unreachable code.
Date: Thu, 24 Feb 2022 17:32:05 +0800
Message-ID: <202202241715.0b7YOhQ9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1291723298319196916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chris Hyser <chris.hyser@oracle.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 7ac592aa35a684ff1858fb9ec282886b9e3575ac sched: prctl() core-schedu=
ling interface
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-m031-20220224 (https://download.01.org/0day-ci/arch=
ive/20220224/202202241715.0b7YOhQ9-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/core_sched.c:175 sched_core_share_pid() warn: ignoring unreach=
able code.

vim +175 kernel/sched/core_sched.c

7ac592aa35a684 Chris Hyser 2021-03-24  124  =

7ac592aa35a684 Chris Hyser 2021-03-24  125  /* Called from prctl interface:=
 PR_SCHED_CORE */
7ac592aa35a684 Chris Hyser 2021-03-24  126  int sched_core_share_pid(unsign=
ed int cmd, pid_t pid, enum pid_type type,
7ac592aa35a684 Chris Hyser 2021-03-24  127  			 unsigned long uaddr)
7ac592aa35a684 Chris Hyser 2021-03-24  128  {
7ac592aa35a684 Chris Hyser 2021-03-24  129  	unsigned long cookie =3D 0, id=
 =3D 0;
7ac592aa35a684 Chris Hyser 2021-03-24  130  	struct task_struct *task, *p;
7ac592aa35a684 Chris Hyser 2021-03-24  131  	struct pid *grp;
7ac592aa35a684 Chris Hyser 2021-03-24  132  	int err =3D 0;
7ac592aa35a684 Chris Hyser 2021-03-24  133  =

7ac592aa35a684 Chris Hyser 2021-03-24  134  	if (!static_branch_likely(&sch=
ed_smt_present))
7ac592aa35a684 Chris Hyser 2021-03-24  135  		return -ENODEV;
7ac592aa35a684 Chris Hyser 2021-03-24  136  =

7ac592aa35a684 Chris Hyser 2021-03-24  137  	if (type > PIDTYPE_PGID || cmd=
 >=3D PR_SCHED_CORE_MAX || pid < 0 ||
7ac592aa35a684 Chris Hyser 2021-03-24  138  	    (cmd !=3D PR_SCHED_CORE_GE=
T && uaddr))
7ac592aa35a684 Chris Hyser 2021-03-24  139  		return -EINVAL;
7ac592aa35a684 Chris Hyser 2021-03-24  140  =

7ac592aa35a684 Chris Hyser 2021-03-24  141  	rcu_read_lock();
7ac592aa35a684 Chris Hyser 2021-03-24  142  	if (pid =3D=3D 0) {
7ac592aa35a684 Chris Hyser 2021-03-24  143  		task =3D current;
7ac592aa35a684 Chris Hyser 2021-03-24  144  	} else {
7ac592aa35a684 Chris Hyser 2021-03-24  145  		task =3D find_task_by_vpid(pi=
d);
7ac592aa35a684 Chris Hyser 2021-03-24  146  		if (!task) {
7ac592aa35a684 Chris Hyser 2021-03-24  147  			rcu_read_unlock();
7ac592aa35a684 Chris Hyser 2021-03-24  148  			return -ESRCH;
7ac592aa35a684 Chris Hyser 2021-03-24  149  		}
7ac592aa35a684 Chris Hyser 2021-03-24  150  	}
7ac592aa35a684 Chris Hyser 2021-03-24  151  	get_task_struct(task);
7ac592aa35a684 Chris Hyser 2021-03-24  152  	rcu_read_unlock();
7ac592aa35a684 Chris Hyser 2021-03-24  153  =

7ac592aa35a684 Chris Hyser 2021-03-24  154  	/*
7ac592aa35a684 Chris Hyser 2021-03-24  155  	 * Check if this process has t=
he right to modify the specified
7ac592aa35a684 Chris Hyser 2021-03-24  156  	 * process. Use the regular "p=
trace_may_access()" checks.
7ac592aa35a684 Chris Hyser 2021-03-24  157  	 */
7ac592aa35a684 Chris Hyser 2021-03-24  158  	if (!ptrace_may_access(task, P=
TRACE_MODE_READ_REALCREDS)) {
7ac592aa35a684 Chris Hyser 2021-03-24  159  		err =3D -EPERM;
7ac592aa35a684 Chris Hyser 2021-03-24  160  		goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  161  	}
7ac592aa35a684 Chris Hyser 2021-03-24  162  =

7ac592aa35a684 Chris Hyser 2021-03-24  163  	switch (cmd) {
7ac592aa35a684 Chris Hyser 2021-03-24  164  	case PR_SCHED_CORE_GET:
7ac592aa35a684 Chris Hyser 2021-03-24  165  		if (type !=3D PIDTYPE_PID || =
uaddr & 7) {
7ac592aa35a684 Chris Hyser 2021-03-24  166  			err =3D -EINVAL;
7ac592aa35a684 Chris Hyser 2021-03-24  167  			goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  168  		}
7ac592aa35a684 Chris Hyser 2021-03-24  169  		cookie =3D sched_core_clone_c=
ookie(task);
7ac592aa35a684 Chris Hyser 2021-03-24  170  		if (cookie) {
7ac592aa35a684 Chris Hyser 2021-03-24  171  			/* XXX improve ? */
7ac592aa35a684 Chris Hyser 2021-03-24  172  			ptr_to_hashval((void *)cooki=
e, &id);
7ac592aa35a684 Chris Hyser 2021-03-24  173  		}
7ac592aa35a684 Chris Hyser 2021-03-24  174  		err =3D put_user(id, (u64 __u=
ser *)uaddr);
7ac592aa35a684 Chris Hyser 2021-03-24 @175  		goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  176  =

7ac592aa35a684 Chris Hyser 2021-03-24  177  	case PR_SCHED_CORE_CREATE:
7ac592aa35a684 Chris Hyser 2021-03-24  178  		cookie =3D sched_core_alloc_c=
ookie();
7ac592aa35a684 Chris Hyser 2021-03-24  179  		if (!cookie) {
7ac592aa35a684 Chris Hyser 2021-03-24  180  			err =3D -ENOMEM;
7ac592aa35a684 Chris Hyser 2021-03-24  181  			goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  182  		}
7ac592aa35a684 Chris Hyser 2021-03-24  183  		break;
7ac592aa35a684 Chris Hyser 2021-03-24  184  =

7ac592aa35a684 Chris Hyser 2021-03-24  185  	case PR_SCHED_CORE_SHARE_TO:
7ac592aa35a684 Chris Hyser 2021-03-24  186  		cookie =3D sched_core_clone_c=
ookie(current);
7ac592aa35a684 Chris Hyser 2021-03-24  187  		break;
7ac592aa35a684 Chris Hyser 2021-03-24  188  =

7ac592aa35a684 Chris Hyser 2021-03-24  189  	case PR_SCHED_CORE_SHARE_FROM:
7ac592aa35a684 Chris Hyser 2021-03-24  190  		if (type !=3D PIDTYPE_PID) {
7ac592aa35a684 Chris Hyser 2021-03-24  191  			err =3D -EINVAL;
7ac592aa35a684 Chris Hyser 2021-03-24  192  			goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  193  		}
7ac592aa35a684 Chris Hyser 2021-03-24  194  		cookie =3D sched_core_clone_c=
ookie(task);
7ac592aa35a684 Chris Hyser 2021-03-24  195  		__sched_core_set(current, coo=
kie);
7ac592aa35a684 Chris Hyser 2021-03-24  196  		goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  197  =

7ac592aa35a684 Chris Hyser 2021-03-24  198  	default:
7ac592aa35a684 Chris Hyser 2021-03-24  199  		err =3D -EINVAL;
7ac592aa35a684 Chris Hyser 2021-03-24  200  		goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  201  	};
7ac592aa35a684 Chris Hyser 2021-03-24  202  =

7ac592aa35a684 Chris Hyser 2021-03-24  203  	if (type =3D=3D PIDTYPE_PID) {
7ac592aa35a684 Chris Hyser 2021-03-24  204  		__sched_core_set(task, cookie=
);
7ac592aa35a684 Chris Hyser 2021-03-24  205  		goto out;
7ac592aa35a684 Chris Hyser 2021-03-24  206  	}
7ac592aa35a684 Chris Hyser 2021-03-24  207  =

7ac592aa35a684 Chris Hyser 2021-03-24  208  	read_lock(&tasklist_lock);
7ac592aa35a684 Chris Hyser 2021-03-24  209  	grp =3D task_pid_type(task, ty=
pe);
7ac592aa35a684 Chris Hyser 2021-03-24  210  =

7ac592aa35a684 Chris Hyser 2021-03-24  211  	do_each_pid_thread(grp, type, =
p) {
7ac592aa35a684 Chris Hyser 2021-03-24  212  		if (!ptrace_may_access(p, PTR=
ACE_MODE_READ_REALCREDS)) {
7ac592aa35a684 Chris Hyser 2021-03-24  213  			err =3D -EPERM;
7ac592aa35a684 Chris Hyser 2021-03-24  214  			goto out_tasklist;
7ac592aa35a684 Chris Hyser 2021-03-24  215  		}
7ac592aa35a684 Chris Hyser 2021-03-24  216  	} while_each_pid_thread(grp, t=
ype, p);
7ac592aa35a684 Chris Hyser 2021-03-24  217  =

7ac592aa35a684 Chris Hyser 2021-03-24  218  	do_each_pid_thread(grp, type, =
p) {
7ac592aa35a684 Chris Hyser 2021-03-24  219  		__sched_core_set(p, cookie);
7ac592aa35a684 Chris Hyser 2021-03-24  220  	} while_each_pid_thread(grp, t=
ype, p);
7ac592aa35a684 Chris Hyser 2021-03-24  221  out_tasklist:
7ac592aa35a684 Chris Hyser 2021-03-24  222  	read_unlock(&tasklist_lock);
7ac592aa35a684 Chris Hyser 2021-03-24  223  =

7ac592aa35a684 Chris Hyser 2021-03-24  224  out:
7ac592aa35a684 Chris Hyser 2021-03-24  225  	sched_core_put_cookie(cookie);
7ac592aa35a684 Chris Hyser 2021-03-24  226  	put_task_struct(task);
7ac592aa35a684 Chris Hyser 2021-03-24  227  	return err;
7ac592aa35a684 Chris Hyser 2021-03-24  228  }
7ac592aa35a684 Chris Hyser 2021-03-24  229  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1291723298319196916==--

