Content-Type: multipart/mixed; boundary="===============1507919197504546201=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kvm/arch_timer.c:317:7: warning: Uninitialized variable: timer_ctx [uninitvar]
Date: Sat, 11 Dec 2021 23:41:52 +0800
Message-ID: <202112112117.mSMG04D7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1507919197504546201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO ins=
tead of TASK_DELAY_ACCT
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kvm/arch_timer.c:317:7: warning: Uninitialized variable: time=
r_ctx [uninitvar]
    if (!timer_ctx)
         ^
>> arch/arm64/kvm/arch_timer.c:1116:31: warning: Uninitialized variable: ti=
mer [uninitvar]
    return kvm_timer_should_fire(timer);
                                 ^

vim +317 arch/arm64/kvm/arch_timer.c

f2a2129e0ac8d8 virt/kvm/arm/arch_timer.c   Christoffer Dall 2017-06-18  311=
  =

1c88ab7ec8c53c virt/kvm/arm/arch_timer.c   Christoffer Dall 2017-01-06  312=
  static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx)
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  313=
  {
bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  314=
  	enum kvm_arch_timers index;
a5a1d1c2914b53 virt/kvm/arm/arch_timer.c   Thomas Gleixner  2016-12-21  315=
  	u64 cval, now;
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  316=
  =

bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04 @317=
  	if (!timer_ctx)
bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  318=
  		return false;
bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  319=
  =

bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  320=
  	index =3D arch_timer_ctx_index(timer_ctx);
bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  321=
  =

bee038a6748759 virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-01-04  322=
  	if (timer_ctx->loaded) {
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  323=
  		u32 cnt_ctl =3D 0;
13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  324=
  =

9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  325=
  		switch (index) {
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  326=
  		case TIMER_VTIMER:
fdec2a9ef85317 virt/kvm/arm/arch_timer.c   Dave Martin      2019-04-06  327=
  			cnt_ctl =3D read_sysreg_el0(SYS_CNTV_CTL);
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  328=
  			break;
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  329=
  		case TIMER_PTIMER:
fdec2a9ef85317 virt/kvm/arm/arch_timer.c   Dave Martin      2019-04-06  330=
  			cnt_ctl =3D read_sysreg_el0(SYS_CNTP_CTL);
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  331=
  			break;
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  332=
  		case NR_KVM_TIMERS:
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  333=
  			/* GCC is braindead */
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  334=
  			cnt_ctl =3D 0;
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  335=
  			break;
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  336=
  		}
9e01dc76be6a3b virt/kvm/arm/arch_timer.c   Christoffer Dall 2019-02-19  337=
  =

13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  338=
  		return  (cnt_ctl & ARCH_TIMER_CTRL_ENABLE) &&
13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  339=
  		        (cnt_ctl & ARCH_TIMER_CTRL_IT_STAT) &&
13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  340=
  		       !(cnt_ctl & ARCH_TIMER_CTRL_IT_MASK);
13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  341=
  	}
13e59ece5b30f3 virt/kvm/arm/arch_timer.c   Christoffer Dall 2018-01-25  342=
  =

9171fa2e0951b0 virt/kvm/arm/arch_timer.c   Jintack Lim      2017-02-03  343=
  	if (!kvm_timer_irq_can_fire(timer_ctx))
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  344=
  		return false;
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  345=
  =

41ce82f63c0624 arch/arm64/kvm/arch_timer.c Marc Zyngier     2019-06-28  346=
  	cval =3D timer_get_cval(timer_ctx);
41ce82f63c0624 arch/arm64/kvm/arch_timer.c Marc Zyngier     2019-06-28  347=
  	now =3D kvm_phys_timer_read() - timer_get_offset(timer_ctx);
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  348=
  =

1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  349=
  	return cval <=3D now;
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  350=
  }
1a74847885cc87 virt/kvm/arm/arch_timer.c   Christoffer Dall 2015-03-13  351=
  =


:::::: The code@line 317 was first introduced by commit
:::::: bee038a67487598ebbe995f85bf60c3a5b2e9099 KVM: arm/arm64: Rework the =
timer code to use a timer_map

:::::: TO: Christoffer Dall <christoffer.dall@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1507919197504546201==--

