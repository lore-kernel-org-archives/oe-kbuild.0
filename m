Content-Type: multipart/mixed; boundary="===============7302045884389599827=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kernel/signal.c:927:6: warning: no previous prototype for 'do_notify_resume'
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207240330.VFswXEYq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7302045884389599827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Joey Gouly <joey.gouly@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 4d1c2ee2709fd6e1655206cafcdb22737f5d7379 arm64: entry: move bulk of=
 ret_to_user to C
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: arm64-alldefconfig (https://download.01.org/0day-ci/archive/2022072=
4/202207240330.VFswXEYq-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4d1c2ee2709fd6e1655206cafcdb22737f5d7379
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4d1c2ee2709fd6e1655206cafcdb22737f5d7379
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/signal.c:927:6: warning: no previous prototype for 'do=
_notify_resume' [-Wmissing-prototypes]
     927 | void do_notify_resume(struct pt_regs *regs, unsigned long thread=
_flags)
         |      ^~~~~~~~~~~~~~~~


vim +/do_notify_resume +927 arch/arm64/kernel/signal.c

873c3e89777c8c Will Deacon       2021-06-08  926  =

4d1c2ee2709fd6 Mark Rutland      2021-08-02 @927  void do_notify_resume(str=
uct pt_regs *regs, unsigned long thread_flags)
2c020ed8d148f7 Catalin Marinas   2012-03-05  928  {
a2048e34d4655c Thomas Garnier    2017-09-07  929  	do {
421dd6fa6709eb Chris Metcalf     2016-07-14  930  		if (thread_flags & _TIF=
_NEED_RESCHED) {
8d66772e869e79 James Morse       2017-11-02  931  			/* Unmask Debug and SE=
rror for the next task */
8d66772e869e79 James Morse       2017-11-02  932  			local_daif_restore(DAI=
F_PROCCTX_NOIRQ);
8d66772e869e79 James Morse       2017-11-02  933  =

421dd6fa6709eb Chris Metcalf     2016-07-14  934  			schedule();
421dd6fa6709eb Chris Metcalf     2016-07-14  935  		} else {
8d66772e869e79 James Morse       2017-11-02  936  			local_daif_restore(DAI=
F_PROCCTX);
421dd6fa6709eb Chris Metcalf     2016-07-14  937  =

9842ceae9fa8de Pratyush Anand    2016-11-02  938  			if (thread_flags & _TI=
F_UPROBE)
9842ceae9fa8de Pratyush Anand    2016-11-02  939  				uprobe_notify_resume(=
regs);
9842ceae9fa8de Pratyush Anand    2016-11-02  940  =

637ec831ea4f09 Vincenzo Frascino 2019-09-16  941  			if (thread_flags & _TI=
F_MTE_ASYNC_FAULT) {
637ec831ea4f09 Vincenzo Frascino 2019-09-16  942  				clear_thread_flag(TIF=
_MTE_ASYNC_FAULT);
637ec831ea4f09 Vincenzo Frascino 2019-09-16  943  				send_sig_fault(SIGSEG=
V, SEGV_MTEAERR,
637ec831ea4f09 Vincenzo Frascino 2019-09-16  944  					       (void __user =
*)NULL, current);
637ec831ea4f09 Vincenzo Frascino 2019-09-16  945  			}
637ec831ea4f09 Vincenzo Frascino 2019-09-16  946  =

192caabd4dd92c Jens Axboe        2020-10-22  947  			if (thread_flags & (_T=
IF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
2c020ed8d148f7 Catalin Marinas   2012-03-05  948  				do_signal(regs);
2c020ed8d148f7 Catalin Marinas   2012-03-05  949  =

2c020ed8d148f7 Catalin Marinas   2012-03-05  950  			if (thread_flags & _TI=
F_NOTIFY_RESUME) {
2c020ed8d148f7 Catalin Marinas   2012-03-05  951  				tracehook_notify_resu=
me(regs);
409d5db49867c2 Will Deacon       2018-06-20  952  				rseq_handle_notify_re=
sume(NULL, regs);
873c3e89777c8c Will Deacon       2021-06-08  953  =

873c3e89777c8c Will Deacon       2021-06-08  954  				/*
873c3e89777c8c Will Deacon       2021-06-08  955  				 * If we reschedule a=
fter checking the affinity
873c3e89777c8c Will Deacon       2021-06-08  956  				 * then we must ensur=
e that TIF_NOTIFY_RESUME
873c3e89777c8c Will Deacon       2021-06-08  957  				 * is set so that we =
check the affinity again.
873c3e89777c8c Will Deacon       2021-06-08  958  				 * Since tracehook_no=
tify_resume() clears the
873c3e89777c8c Will Deacon       2021-06-08  959  				 * flag, ensure that =
the compiler doesn't move
873c3e89777c8c Will Deacon       2021-06-08  960  				 * it after the affin=
ity check.
873c3e89777c8c Will Deacon       2021-06-08  961  				 */
873c3e89777c8c Will Deacon       2021-06-08  962  				barrier();
873c3e89777c8c Will Deacon       2021-06-08  963  =

873c3e89777c8c Will Deacon       2021-06-08  964  				if (cpu_affinity_inva=
lid(regs))
873c3e89777c8c Will Deacon       2021-06-08  965  					force_sig(SIGKILL);
2c020ed8d148f7 Catalin Marinas   2012-03-05  966  			}
005f78cd884944 Ard Biesheuvel    2014-05-08  967  =

005f78cd884944 Ard Biesheuvel    2014-05-08  968  			if (thread_flags & _TI=
F_FOREIGN_FPSTATE)
005f78cd884944 Ard Biesheuvel    2014-05-08  969  				fpsimd_restore_curren=
t_state();
421dd6fa6709eb Chris Metcalf     2016-07-14  970  		}
005f78cd884944 Ard Biesheuvel    2014-05-08  971  =

8d66772e869e79 James Morse       2017-11-02  972  		local_daif_mask();
421dd6fa6709eb Chris Metcalf     2016-07-14  973  		thread_flags =3D READ_O=
NCE(current_thread_info()->flags);
421dd6fa6709eb Chris Metcalf     2016-07-14  974  	} while (thread_flags & =
_TIF_WORK_MASK);
2c020ed8d148f7 Catalin Marinas   2012-03-05  975  }
94b07c1f8c39c6 Dave Martin       2018-06-01  976  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7302045884389599827==--

