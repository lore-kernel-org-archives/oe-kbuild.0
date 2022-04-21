Content-Type: multipart/mixed; boundary="===============1824019456094308179=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] ptrace: Don't change __state
Date: Thu, 21 Apr 2022 21:01:37 +0800
Message-ID: <202204212059.YwL7ZaJN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1824019456094308179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>
References: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>
TO: "Eric W. Biederman" <ebiederm@xmission.com>

Hi "Eric,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/ptr=
ace-Don-t-change-__state/20220421-045703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b253435746d9a4a701b5f09211b9c14d3370d0da
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
421/202204212059.YwL7ZaJN-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/ptrace.c:894 ptrace_resume() error: uninitialized symbol 'need_siglo=
ck'.

vim +/need_siglock +894 kernel/ptrace.c

36df29d7994180 Roland McGrath 2008-01-30  868  =

5b88abbf770a0e Roland McGrath 2008-01-30  869  	if (is_singleblock(request)=
) {
5b88abbf770a0e Roland McGrath 2008-01-30  870  		if (unlikely(!arch_has_blo=
ck_step()))
5b88abbf770a0e Roland McGrath 2008-01-30  871  			return -EIO;
5b88abbf770a0e Roland McGrath 2008-01-30  872  		user_enable_block_step(chi=
ld);
5b88abbf770a0e Roland McGrath 2008-01-30  873  	} else if (is_singlestep(re=
quest) || is_sysemu_singlestep(request)) {
36df29d7994180 Roland McGrath 2008-01-30  874  		if (unlikely(!arch_has_sin=
gle_step()))
36df29d7994180 Roland McGrath 2008-01-30  875  			return -EIO;
36df29d7994180 Roland McGrath 2008-01-30  876  		user_enable_single_step(ch=
ild);
3a709703538c47 Roland McGrath 2009-04-07  877  	} else {
36df29d7994180 Roland McGrath 2008-01-30  878  		user_disable_single_step(c=
hild);
3a709703538c47 Roland McGrath 2009-04-07  879  	}
36df29d7994180 Roland McGrath 2008-01-30  880  =

b72c186999e689 Oleg Nesterov  2015-04-16  881  	/*
b72c186999e689 Oleg Nesterov  2015-04-16  882  	 * Change ->exit_code and -=
>state under siglock to avoid the race
b72c186999e689 Oleg Nesterov  2015-04-16  883  	 * with wait_task_stopped()=
 in between; a non-zero ->exit_code will
b72c186999e689 Oleg Nesterov  2015-04-16  884  	 * wrongly look like anothe=
r report from tracee.
b72c186999e689 Oleg Nesterov  2015-04-16  885  	 *
b72c186999e689 Oleg Nesterov  2015-04-16  886  	 * Note that we need sigloc=
k even if ->exit_code =3D=3D data and/or this
b72c186999e689 Oleg Nesterov  2015-04-16  887  	 * status was not reported =
yet, the new status must not be cleared by
b72c186999e689 Oleg Nesterov  2015-04-16  888  	 * wait_task_stopped() afte=
r resume.
b72c186999e689 Oleg Nesterov  2015-04-16  889  	 *
b72c186999e689 Oleg Nesterov  2015-04-16  890  	 * If data =3D=3D 0 we do n=
ot care if wait_task_stopped() reports the old
b72c186999e689 Oleg Nesterov  2015-04-16  891  	 * status and clears the co=
de too; this can't race with the tracee, it
b72c186999e689 Oleg Nesterov  2015-04-16  892  	 * takes siglock after resu=
me.
b72c186999e689 Oleg Nesterov  2015-04-16  893  	 */
b72c186999e689 Oleg Nesterov  2015-04-16 @894  	if (need_siglock)
b72c186999e689 Oleg Nesterov  2015-04-16  895  		spin_lock_irq(&child->sigh=
and->siglock);
36df29d7994180 Roland McGrath 2008-01-30  896  	child->exit_code =3D data;
0666fb51b1483f Oleg Nesterov  2011-05-25  897  	wake_up_state(child, __TASK=
_TRACED);
b72c186999e689 Oleg Nesterov  2015-04-16  898  	if (need_siglock)
b72c186999e689 Oleg Nesterov  2015-04-16  899  		spin_unlock_irq(&child->si=
ghand->siglock);
36df29d7994180 Roland McGrath 2008-01-30  900  =

36df29d7994180 Roland McGrath 2008-01-30  901  	return 0;
36df29d7994180 Roland McGrath 2008-01-30  902  }
36df29d7994180 Roland McGrath 2008-01-30  903  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1824019456094308179==--

