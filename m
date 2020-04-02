Content-Type: multipart/mixed; boundary="===============5913566297731548208=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] x86/perf: Add hardware performance events support for Zhaoxin CPU.
Date: Thu, 02 Apr 2020 15:10:10 +0300
Message-ID: <20200402121010.GO2001@kadam>
In-Reply-To: <1585647599-6649-1-git-send-email-CodyYao-oc@zhaoxin.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5913566297731548208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi CodyYao-oc,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/CodyYao-oc/x86-perf-Add-ha=
rdware-performance-events-support-for-Zhaoxin-CPU/20200331-223205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 629b3df=
7ecb01fddfdf71cb5d3c563d143117c33

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/events/zhaoxin/core.c:369 zhaoxin_pmu_handle_irq() error: uninitia=
lized symbol 'is_zxc'.

# https://github.com/0day-ci/linux/commit/41b71fb039d254422d4d46c8e7beef30c=
11c9d39
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 41b71fb039d254422d4d46c8e7beef30c11c9d39
vim +/is_zxc +369 arch/x86/events/zhaoxin/core.c

41b71fb039d254 CodyYao-oc 2020-03-31  346  static int zhaoxin_pmu_handle_ir=
q(struct pt_regs *regs)
41b71fb039d254 CodyYao-oc 2020-03-31  347  {
41b71fb039d254 CodyYao-oc 2020-03-31  348  	struct perf_sample_data data;
41b71fb039d254 CodyYao-oc 2020-03-31  349  	struct cpu_hw_events *cpuc;
41b71fb039d254 CodyYao-oc 2020-03-31  350  	int bit;
41b71fb039d254 CodyYao-oc 2020-03-31  351  	u64 status;
41b71fb039d254 CodyYao-oc 2020-03-31  352  	bool is_zxc;
                                                ^^^^^^^^^^^
bool is_zxc =3D false;

41b71fb039d254 CodyYao-oc 2020-03-31  353  	int handled =3D 0;
41b71fb039d254 CodyYao-oc 2020-03-31  354  =

41b71fb039d254 CodyYao-oc 2020-03-31  355  	cpuc =3D this_cpu_ptr(&cpu_hw_e=
vents);
41b71fb039d254 CodyYao-oc 2020-03-31  356  	apic_write(APIC_LVTPC, APIC_DM_=
NMI);
41b71fb039d254 CodyYao-oc 2020-03-31  357  	zhaoxin_pmu_disable_all();
41b71fb039d254 CodyYao-oc 2020-03-31  358  	status =3D zhaoxin_pmu_get_stat=
us();
41b71fb039d254 CodyYao-oc 2020-03-31  359  	if (!status)
41b71fb039d254 CodyYao-oc 2020-03-31  360  		goto done;
41b71fb039d254 CodyYao-oc 2020-03-31  361  =

41b71fb039d254 CodyYao-oc 2020-03-31  362  	if (boot_cpu_data.x86 =3D=3D 0x=
06 &&
41b71fb039d254 CodyYao-oc 2020-03-31  363  		(boot_cpu_data.x86_model =3D=
=3D 0x0f ||
41b71fb039d254 CodyYao-oc 2020-03-31  364  			boot_cpu_data.x86_model =3D=
=3D 0x19))
41b71fb039d254 CodyYao-oc 2020-03-31  365  		is_zxc =3D true;
41b71fb039d254 CodyYao-oc 2020-03-31  366  again:
41b71fb039d254 CodyYao-oc 2020-03-31  367  =

41b71fb039d254 CodyYao-oc 2020-03-31  368  	/*Clearing status works only if=
 the global control is enable on zxc.*/
41b71fb039d254 CodyYao-oc 2020-03-31 @369  	if (is_zxc)
                                                    ^^^^^^

41b71fb039d254 CodyYao-oc 2020-03-31  370  		wrmsrl(MSR_CORE_PERF_GLOBAL_CT=
RL, x86_pmu.intel_ctrl);
41b71fb039d254 CodyYao-oc 2020-03-31  371  =

41b71fb039d254 CodyYao-oc 2020-03-31  372  	zhaoxin_pmu_ack_status(status);
41b71fb039d254 CodyYao-oc 2020-03-31  373  =

41b71fb039d254 CodyYao-oc 2020-03-31  374  	if (is_zxc)
41b71fb039d254 CodyYao-oc 2020-03-31  375  		wrmsrl(MSR_CORE_PERF_GLOBAL_CT=
RL, 0);
41b71fb039d254 CodyYao-oc 2020-03-31  376  =

41b71fb039d254 CodyYao-oc 2020-03-31  377  	inc_irq_stat(apic_perf_irqs);
41b71fb039d254 CodyYao-oc 2020-03-31  378  =

41b71fb039d254 CodyYao-oc 2020-03-31  379  	/*
41b71fb039d254 CodyYao-oc 2020-03-31  380  	 * CondChgd bit 63 doesn't mean=
 any overflow status. Ignore
41b71fb039d254 CodyYao-oc 2020-03-31  381  	 * and clear the bit.
41b71fb039d254 CodyYao-oc 2020-03-31  382  	 */
41b71fb039d254 CodyYao-oc 2020-03-31  383  	if (__test_and_clear_bit(63, (u=
nsigned long *)&status)) {
41b71fb039d254 CodyYao-oc 2020-03-31  384  		if (!status)
41b71fb039d254 CodyYao-oc 2020-03-31  385  			goto done;
41b71fb039d254 CodyYao-oc 2020-03-31  386  	}
41b71fb039d254 CodyYao-oc 2020-03-31  387  =

41b71fb039d254 CodyYao-oc 2020-03-31  388  	for_each_set_bit(bit, (unsigned=
 long *)&status, X86_PMC_IDX_MAX) {
41b71fb039d254 CodyYao-oc 2020-03-31  389  		struct perf_event *event =3D c=
puc->events[bit];
41b71fb039d254 CodyYao-oc 2020-03-31  390  =

41b71fb039d254 CodyYao-oc 2020-03-31  391  		handled++;
41b71fb039d254 CodyYao-oc 2020-03-31  392  =

41b71fb039d254 CodyYao-oc 2020-03-31  393  		if (!test_bit(bit, cpuc->activ=
e_mask))
41b71fb039d254 CodyYao-oc 2020-03-31  394  			continue;
41b71fb039d254 CodyYao-oc 2020-03-31  395  =

41b71fb039d254 CodyYao-oc 2020-03-31  396  		x86_perf_event_update(event);
41b71fb039d254 CodyYao-oc 2020-03-31  397  		perf_sample_data_init(&data, 0=
, event->hw.last_period);
41b71fb039d254 CodyYao-oc 2020-03-31  398  =

41b71fb039d254 CodyYao-oc 2020-03-31  399  		if (!x86_perf_event_set_period=
(event))
41b71fb039d254 CodyYao-oc 2020-03-31  400  			continue;
41b71fb039d254 CodyYao-oc 2020-03-31  401  =

41b71fb039d254 CodyYao-oc 2020-03-31  402  		if (perf_event_overflow(event,=
 &data, regs))
41b71fb039d254 CodyYao-oc 2020-03-31  403  			x86_pmu_stop(event, 0);
41b71fb039d254 CodyYao-oc 2020-03-31  404  	}
41b71fb039d254 CodyYao-oc 2020-03-31  405  =

41b71fb039d254 CodyYao-oc 2020-03-31  406  	/*
41b71fb039d254 CodyYao-oc 2020-03-31  407  	 * Repeat if there is more work=
 to be done:
41b71fb039d254 CodyYao-oc 2020-03-31  408  	 */
41b71fb039d254 CodyYao-oc 2020-03-31  409  	status =3D zhaoxin_pmu_get_stat=
us();
41b71fb039d254 CodyYao-oc 2020-03-31  410  	if (status)
41b71fb039d254 CodyYao-oc 2020-03-31  411  		goto again;
41b71fb039d254 CodyYao-oc 2020-03-31  412  =

41b71fb039d254 CodyYao-oc 2020-03-31  413  done:
41b71fb039d254 CodyYao-oc 2020-03-31  414  	zhaoxin_pmu_enable_all(0);
41b71fb039d254 CodyYao-oc 2020-03-31  415  	return handled;
41b71fb039d254 CodyYao-oc 2020-03-31  416  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5913566297731548208==--

