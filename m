Content-Type: multipart/mixed; boundary="===============3546603660625224331=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luto:sched/lazymm 8/14] fs/exec.c:1012:10: warning: Uninitialized variable: active_mm [uninitvar]
Date: Sun, 04 Jul 2021 05:57:36 +0800
Message-ID: <202107040525.kJqongeo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3546603660625224331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Lutomirski <luto@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git sche=
d/lazymm
head:   755ebd64bdde9503ba31bdcda9bb7cc5fe8b73b4
commit: ed4e648f7e1f8c6251b883ff42675ff291ee68dc [8/14] sched, exec: Move t=
he activate_mm() call sequence into sched/core.c
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/exec.c:1012:10: warning: Uninitialized variable: active_mm [uninitvar]
     BUG_ON(active_mm !=3D old_mm);
            ^

vim +1012 fs/exec.c

3dc20cb282ec03c Al Viro           2013-04-13   966  =

eea9673250db4e8 Eric W. Biederman 2020-03-25   967  /*
eea9673250db4e8 Eric W. Biederman 2020-03-25   968   * Maps the mm_struct m=
m into the current task struct.
f7cfd871ae0c500 Eric W. Biederman 2020-12-03   969   * On success, this fun=
ction returns with exec_update_lock
f7cfd871ae0c500 Eric W. Biederman 2020-12-03   970   * held for writing.
eea9673250db4e8 Eric W. Biederman 2020-03-25   971   */
^1da177e4c3f415 Linus Torvalds    2005-04-16   972  static int exec_mmap(st=
ruct mm_struct *mm)
^1da177e4c3f415 Linus Torvalds    2005-04-16   973  {
^1da177e4c3f415 Linus Torvalds    2005-04-16   974  	struct task_struct *ts=
k;
^1da177e4c3f415 Linus Torvalds    2005-04-16   975  	struct mm_struct *old_=
mm, *active_mm;
eea9673250db4e8 Eric W. Biederman 2020-03-25   976  	int ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16   977  =

^1da177e4c3f415 Linus Torvalds    2005-04-16   978  	/* Notify parent that =
we're no longer interested in the old VM */
^1da177e4c3f415 Linus Torvalds    2005-04-16   979  	tsk =3D current;
^1da177e4c3f415 Linus Torvalds    2005-04-16   980  	old_mm =3D current->mm;
4610ba7ad877faf Thomas Gleixner   2019-11-06   981  	exec_mm_release(tsk, o=
ld_mm);
a28bf136e651e17 Eric W. Biederman 2020-03-30   982  	if (old_mm)
a28bf136e651e17 Eric W. Biederman 2020-03-30   983  		sync_mm_rss(old_mm);
^1da177e4c3f415 Linus Torvalds    2005-04-16   984  =

f7cfd871ae0c500 Eric W. Biederman 2020-12-03   985  	ret =3D down_write_kil=
lable(&tsk->signal->exec_update_lock);
eea9673250db4e8 Eric W. Biederman 2020-03-25   986  	if (ret)
eea9673250db4e8 Eric W. Biederman 2020-03-25   987  		return ret;
eea9673250db4e8 Eric W. Biederman 2020-03-25   988  =

^1da177e4c3f415 Linus Torvalds    2005-04-16   989  	if (old_mm) {
^1da177e4c3f415 Linus Torvalds    2005-04-16   990  		/*
^1da177e4c3f415 Linus Torvalds    2005-04-16   991  		 * Make sure that if =
there is a core dump in progress
^1da177e4c3f415 Linus Torvalds    2005-04-16   992  		 * for the old mm, we=
 get out and die instead of going
c1e8d7c6a7a682e Michel Lespinasse 2020-06-08   993  		 * through with the e=
xec.  We must hold mmap_lock around
999d9fc1670bc08 Oleg Nesterov     2008-07-25   994  		 * checking core_stat=
e and changing tsk->mm.
^1da177e4c3f415 Linus Torvalds    2005-04-16   995  		 */
d8ed45c5dcd455f Michel Lespinasse 2020-06-08   996  		mmap_read_lock(old_mm=
);
999d9fc1670bc08 Oleg Nesterov     2008-07-25   997  		if (unlikely(old_mm->=
core_state)) {
d8ed45c5dcd455f Michel Lespinasse 2020-06-08   998  			mmap_read_unlock(old=
_mm);
f7cfd871ae0c500 Eric W. Biederman 2020-12-03   999  			up_write(&tsk->signa=
l->exec_update_lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1000  			return -EINTR;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1001  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1002  	}
eea9673250db4e8 Eric W. Biederman 2020-03-25  1003  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  1004  	task_lock(tsk);
227a4aadc75ba22 Mathieu Desnoyers 2019-09-19  1005  	membarrier_exec_mmap(m=
m);
ed4e648f7e1f8c6 Andy Lutomirski   2021-06-22  1006  	__activate_mm(mm);
615d6e8756c8714 Davidlohr Bueso   2014-04-07  1007  	tsk->mm->vmacache_seqn=
um =3D 0;
615d6e8756c8714 Davidlohr Bueso   2014-04-07  1008  	vmacache_flush(tsk);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1009  	task_unlock(tsk);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1010  	if (old_mm) {
d8ed45c5dcd455f Michel Lespinasse 2020-06-08  1011  		mmap_read_unlock(old_=
mm);
7dddb12c63553db Eric Sesterhenn   2006-04-01 @1012  		BUG_ON(active_mm !=3D=
 old_mm);
701085b219016d3 Oleg Nesterov     2012-03-19  1013  		setmax_mm_hiwater_rss=
(&tsk->signal->maxrss, old_mm);
31a78f23bac0069 Balbir Singh      2008-09-28  1014  		mm_update_next_owner(=
old_mm);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1015  		mmput(old_mm);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1016  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1017  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1018  	mmdrop(active_mm);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1019  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1020  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  1021  =


:::::: The code at line 1012 was first introduced by commit
:::::: 7dddb12c63553db850365cfd066a00416aa8c6cb BUG_ON() Conversion in fs/e=
xec.c

:::::: TO: Eric Sesterhenn <snakebyte@gmx.de>
:::::: CC: Adrian Bunk <bunk@stusta.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3546603660625224331==--

