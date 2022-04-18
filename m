Content-Type: multipart/mixed; boundary="===============7808026365416194131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hv/hv.c:215 hv_synic_enable_regs() warn: should 'simp.base_simp_gpa << 12' be a 64 bit type?
Date: Mon, 18 Apr 2022 08:27:53 +0800
Message-ID: <202204180856.jhbbYRFN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7808026365416194131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: faff44069ff538ccdfef187c4d7ec83d22dfb3a4 x86/hyperv: Add Write/Read=
 MSR registers via ghcb page
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m031-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204180856.jhbbYRFN-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hv/hv.c:215 hv_synic_enable_regs() warn: should 'simp.base_simp_gpa=
 << 12' be a 64 bit type?
drivers/hv/hv.c:232 hv_synic_enable_regs() warn: should 'siefp.base_siefp_g=
pa << 12' be a 64 bit type?

vim +215 drivers/hv/hv.c

2608fb65310341 drivers/hv/hv.c         Jason Wang         2013-06-19  192  =

3e189519557978 drivers/staging/hv/Hv.c Hank Janssen       2010-03-04  193  =
/*
68cb8117132c0f drivers/hv/hv.c         Joe Perches        2018-03-04  194  =
 * hv_synic_init - Initialize the Synthetic Interrupt Controller.
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  195  =
 *
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  196  =
 * If it is already initialized by another entity (ie x2v shim), we need to
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  197  =
 * retrieve the initialized message and event pages.  Otherwise, we create =
and
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  198  =
 * initialize the message and event pages.
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  199  =
 */
dba61cda30469a drivers/hv/hv.c         Dexuan Cui         2019-09-05  200  =
void hv_synic_enable_regs(unsigned int cpu)
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  201  {
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger  2017-02-11  202  =
	struct hv_per_cpu_context *hv_cpu
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger  2017-02-11  203  =
		=3D per_cpu_ptr(hv_context.cpu_context, cpu);
eacb1b4d24c2a8 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-20  204  =
	union hv_synic_simp simp;
eacb1b4d24c2a8 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-20  205  =
	union hv_synic_siefp siefp;
b8dfb264f4f9e5 drivers/staging/hv/hv.c Haiyang Zhang      2010-11-08  206  =
	union hv_synic_sint shared_sint;
eacb1b4d24c2a8 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-20  207  =
	union hv_synic_scontrol sctrl;
a73e6b7c508f61 drivers/staging/hv/Hv.c Hank Janssen       2010-01-22  208  =

454f18a963cf65 drivers/staging/hv/Hv.c Bill Pemberton     2009-07-27  209  =
	/* Setup the Synic's message page */
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  210  =
	simp.as_uint64 =3D hv_get_register(HV_REGISTER_SIMP);
f6feebe073db4c drivers/staging/hv/hv.c Haiyang Zhang      2010-11-08  211  =
	simp.simp_enabled =3D 1;
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  212  =

faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  213  =
	if (hv_isolation_type_snp()) {
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  214  =
		hv_cpu->synic_message_page
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25 @215  =
			=3D memremap(simp.base_simp_gpa << HV_HYP_PAGE_SHIFT,
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  216  =
				   HV_HYP_PAGE_SIZE, MEMREMAP_WB);
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  217  =
		if (!hv_cpu->synic_message_page)
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  218  =
			pr_err("Fail to map syinc message page.\n");
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  219  =
	} else {
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger  2017-02-11  220  =
		simp.base_simp_gpa =3D virt_to_phys(hv_cpu->synic_message_page)
ef514d3e38edf3 drivers/hv/hv.c         Boqun Feng         2020-09-16  221  =
			>> HV_HYP_PAGE_SHIFT;
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  222  =
	}
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  223  =

f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  224  =
	hv_set_register(HV_REGISTER_SIMP, simp.as_uint64);
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  225  =

454f18a963cf65 drivers/staging/hv/Hv.c Bill Pemberton     2009-07-27  226  =
	/* Setup the Synic's event page */
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  227  =
	siefp.as_uint64 =3D hv_get_register(HV_REGISTER_SIEFP);
f6feebe073db4c drivers/staging/hv/hv.c Haiyang Zhang      2010-11-08  228  =
	siefp.siefp_enabled =3D 1;
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  229  =

faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  230  =
	if (hv_isolation_type_snp()) {
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  231  =
		hv_cpu->synic_event_page =3D
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25 @232  =
			memremap(siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT,
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  233  =
				 HV_HYP_PAGE_SIZE, MEMREMAP_WB);
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  234  =

faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  235  =
		if (!hv_cpu->synic_event_page)
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  236  =
			pr_err("Fail to map syinc event page.\n");
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  237  =
	} else {
37cdd991fac810 drivers/hv/hv.c         Stephen Hemminger  2017-02-11  238  =
		siefp.base_siefp_gpa =3D virt_to_phys(hv_cpu->synic_event_page)
ef514d3e38edf3 drivers/hv/hv.c         Boqun Feng         2020-09-16  239  =
			>> HV_HYP_PAGE_SHIFT;
faff44069ff538 drivers/hv/hv.c         Tianyu Lan         2021-10-25  240  =
	}
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  241  =

f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  242  =
	hv_set_register(HV_REGISTER_SIEFP, siefp.as_uint64);
0831ad041fd361 drivers/staging/hv/Hv.c Greg Kroah-Hartman 2009-08-31  243  =

454f18a963cf65 drivers/staging/hv/Hv.c Bill Pemberton     2009-07-27  244  =
	/* Setup the shared SINT. */
d608715d4771cf drivers/hv/hv.c         Michael Kelley     2021-03-02  245  =
	if (vmbus_irq !=3D -1)
d608715d4771cf drivers/hv/hv.c         Michael Kelley     2021-03-02  246  =
		enable_percpu_irq(vmbus_irq, 0);
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  247  =
	shared_sint.as_uint64 =3D hv_get_register(HV_REGISTER_SINT0 +
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  248  =
					VMBUS_MESSAGE_SINT);
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  249  =

d608715d4771cf drivers/hv/hv.c         Michael Kelley     2021-03-02  250  =
	shared_sint.vector =3D vmbus_interrupt;
b8dfb264f4f9e5 drivers/staging/hv/hv.c Haiyang Zhang      2010-11-08  251  =
	shared_sint.masked =3D false;
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  252  =

946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  253  =
	/*
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  254  =
	 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  255  =
	 * it doesn't provide a recommendation flag and AEOI must be disabled.
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  256  =
	 */
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  257  =
#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  258  =
	shared_sint.auto_eoi =3D
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  259  =
			!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  260  =
#else
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  261  =
	shared_sint.auto_eoi =3D 0;
946f4b8680b8ad drivers/hv/hv.c         Michael Kelley     2021-03-02  262  =
#endif
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  263  =
	hv_set_register(HV_REGISTER_SINT0 + VMBUS_MESSAGE_SINT,
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  264  =
				shared_sint.as_uint64);
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  265  =

454f18a963cf65 drivers/staging/hv/Hv.c Bill Pemberton     2009-07-27  266  =
	/* Enable the global synic bit */
f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  267  =
	sctrl.as_uint64 =3D hv_get_register(HV_REGISTER_SCONTROL);
f6feebe073db4c drivers/staging/hv/hv.c Haiyang Zhang      2010-11-08  268  =
	sctrl.enable =3D 1;
3e7ee4902fe699 drivers/staging/hv/Hv.c Hank Janssen       2009-07-13  269  =

f3c5e63c3690fc drivers/hv/hv.c         Michael Kelley     2021-03-02  270  =
	hv_set_register(HV_REGISTER_SCONTROL, sctrl.as_uint64);
dba61cda30469a drivers/hv/hv.c         Dexuan Cui         2019-09-05  271  }
dba61cda30469a drivers/hv/hv.c         Dexuan Cui         2019-09-05  272  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7808026365416194131==--

