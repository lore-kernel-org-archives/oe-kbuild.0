Content-Type: multipart/mixed; boundary="===============4042371527767848551=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] pseries/mce: Refactor the pseries mce handling code
Date: Fri, 26 Nov 2021 06:03:25 +0800
Message-ID: <202111260536.m57xOEqc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4042371527767848551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211124095500.98656-2-ganeshgr@linux.ibm.com>
References: <20211124095500.98656-2-ganeshgr@linux.ibm.com>
TO: Ganesh Goudar <ganeshgr@linux.ibm.com>
TO: linuxppc-dev(a)lists.ozlabs.org
TO: mpe(a)ellerman.id.au
CC: Ganesh Goudar <ganeshgr@linux.ibm.com>
CC: mahesh(a)linux.ibm.com
CC: npiggin(a)gmail.com
CC: dja(a)axtens.net

Hi Ganesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ganesh-Goudar/powerpc-mce-=
Avoid-using-irq_work_queue-in-realmode/20211124-175800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-c024-20211124 (https://download.01.org/0day-ci=
/archive/20211126/202111260536.m57xOEqc-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/ras.c:550:6-8: WARNING: possible conditio=
n with no effect (if =3D=3D else)

vim +550 arch/powerpc/platforms/pseries/ras.c

^1da177e4c3f41 arch/ppc64/kernel/ras.c              Linus Torvalds    2005-=
04-16  513  =

3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  514  static int mce_handle_error(struct pt_regs *regs, struct rtas_e=
rror_log *errp)
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  515  {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  516  	struct mce_error_info mce_err =3D { 0 };
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  517  	unsigned long eaddr =3D 0, paddr =3D 0;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  518  	struct pseries_errorlog *pseries_log;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  519  	struct pseries_mc_errorlog *mce_log;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  520  	int disposition =3D rtas_error_disposition(errp);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  521  	int initiator =3D rtas_error_initiator(errp);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  522  	int severity =3D rtas_error_severity(errp);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  523  	u8 error_type, err_sub_type;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  524  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  525  	if (initiator =3D=3D RTAS_INITIATOR_UNKNOWN)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  526  		mce_err.initiator =3D MCE_INITIATOR_UNKNOWN;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  527  	else if (initiator =3D=3D RTAS_INITIATOR_CPU)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  528  		mce_err.initiator =3D MCE_INITIATOR_CPU;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  529  	else if (initiator =3D=3D RTAS_INITIATOR_PCI)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  530  		mce_err.initiator =3D MCE_INITIATOR_PCI;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  531  	else if (initiator =3D=3D RTAS_INITIATOR_ISA)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  532  		mce_err.initiator =3D MCE_INITIATOR_ISA;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  533  	else if (initiator =3D=3D RTAS_INITIATOR_MEMORY)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  534  		mce_err.initiator =3D MCE_INITIATOR_MEMORY;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  535  	else if (initiator =3D=3D RTAS_INITIATOR_POWERMGM)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  536  		mce_err.initiator =3D MCE_INITIATOR_POWERMGM;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  537  	else
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  538  		mce_err.initiator =3D MCE_INITIATOR_UNKNOWN;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  539  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  540  	if (severity =3D=3D RTAS_SEVERITY_NO_ERROR)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  541  		mce_err.severity =3D MCE_SEV_NO_ERROR;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  542  	else if (severity =3D=3D RTAS_SEVERITY_EVENT)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  543  		mce_err.severity =3D MCE_SEV_WARNING;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  544  	else if (severity =3D=3D RTAS_SEVERITY_WARNING)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  545  		mce_err.severity =3D MCE_SEV_WARNING;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  546  	else if (severity =3D=3D RTAS_SEVERITY_ERROR_SYNC)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  547  		mce_err.severity =3D MCE_SEV_SEVERE;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  548  	else if (severity =3D=3D RTAS_SEVERITY_ERROR)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  549  		mce_err.severity =3D MCE_SEV_SEVERE;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24 @550  	else if (severity =3D=3D RTAS_SEVERITY_FATAL)
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  551  		mce_err.severity =3D MCE_SEV_FATAL;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  552  	else
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  553  		mce_err.severity =3D MCE_SEV_FATAL;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  554  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  555  	if (severity <=3D RTAS_SEVERITY_ERROR_SYNC)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  556  		mce_err.sync_error =3D true;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  557  	else
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  558  		mce_err.sync_error =3D false;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  559  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  560  	mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  561  	mce_err.error_class =3D MCE_ECLASS_UNKNOWN;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  562  =

3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  563  	if (!rtas_error_extended(errp))
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  564  		goto out;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  565  =

3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  566  	pseries_log =3D get_pseries_errorlog(errp, PSERIES_ELOG_SECT_I=
D_MCE);
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  567  	if (!pseries_log)
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  568  		goto out;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  569  =

3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  570  	mce_log =3D (struct pseries_mc_errorlog *)pseries_log->data;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  571  	error_type =3D mce_log->error_type;
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  572  	err_sub_type =3D rtas_mc_error_sub_type(mce_log);
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  573  =

3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  574  	switch (mce_log->error_type) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  575  	case MC_ERROR_TYPE_UE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  576  		mce_err.error_type =3D MCE_ERROR_TYPE_UE;
efbc4303b255bb arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2020-=
03-27  577  		mce_common_process_ue(regs, &mce_err);
efbc4303b255bb arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2020-=
03-27  578  		if (mce_err.ignore_event)
efbc4303b255bb arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2020-=
03-27  579  			disposition =3D RTAS_DISP_FULLY_RECOVERED;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  580  		switch (err_sub_type) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  581  		case MC_ERROR_UE_IFETCH:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  582  			mce_err.u.ue_error_type =3D MCE_UE_ERROR_IFETCH;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  583  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  584  		case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  585  			mce_err.u.ue_error_type =3D MCE_UE_ERROR_PAGE_TABLE_WALK_IFE=
TCH;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  586  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  587  		case MC_ERROR_UE_LOAD_STORE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  588  			mce_err.u.ue_error_type =3D MCE_UE_ERROR_LOAD_STORE;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  589  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  590  		case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  591  			mce_err.u.ue_error_type =3D MCE_UE_ERROR_PAGE_TABLE_WALK_LOA=
D_STORE;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  592  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  593  		case MC_ERROR_UE_INDETERMINATE:
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  594  		default:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  595  			mce_err.u.ue_error_type =3D MCE_UE_ERROR_INDETERMINATE;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  596  			break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  597  		}
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  598  		if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  599  			eaddr =3D be64_to_cpu(mce_log->effective_address);
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  600  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  601  		if (mce_log->sub_err_type & UE_LOGICAL_ADDR_PROVIDED) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  602  			paddr =3D be64_to_cpu(mce_log->logical_address);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  603  		} else if (mce_log->sub_err_type & UE_EFFECTIVE_ADDR_PROVIDED=
) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  604  			unsigned long pfn;
c6d15258cdf1c1 arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  605  =

9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  606  			pfn =3D addr_to_pfn(regs, eaddr);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  607  			if (pfn !=3D ULONG_MAX)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  608  				paddr =3D pfn << PAGE_SHIFT;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  609  		}
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  610  =

8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  611  		break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  612  	case MC_ERROR_TYPE_SLB:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  613  		mce_err.error_type =3D MCE_ERROR_TYPE_SLB;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  614  		switch (err_sub_type) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  615  		case MC_ERROR_SLB_PARITY:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  616  			mce_err.u.slb_error_type =3D MCE_SLB_ERROR_PARITY;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  617  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  618  		case MC_ERROR_SLB_MULTIHIT:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  619  			mce_err.u.slb_error_type =3D MCE_SLB_ERROR_MULTIHIT;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  620  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  621  		case MC_ERROR_SLB_INDETERMINATE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  622  		default:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  623  			mce_err.u.slb_error_type =3D MCE_SLB_ERROR_INDETERMINATE;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  624  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  625  		}
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  626  		if (mce_log->sub_err_type & 0x80)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  627  			eaddr =3D be64_to_cpu(mce_log->effective_address);
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  628  		break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  629  	case MC_ERROR_TYPE_ERAT:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  630  		mce_err.error_type =3D MCE_ERROR_TYPE_ERAT;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  631  		switch (err_sub_type) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  632  		case MC_ERROR_ERAT_PARITY:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  633  			mce_err.u.erat_error_type =3D MCE_ERAT_ERROR_PARITY;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  634  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  635  		case MC_ERROR_ERAT_MULTIHIT:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  636  			mce_err.u.erat_error_type =3D MCE_ERAT_ERROR_MULTIHIT;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  637  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  638  		case MC_ERROR_ERAT_INDETERMINATE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  639  		default:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  640  			mce_err.u.erat_error_type =3D MCE_ERAT_ERROR_INDETERMINATE;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  641  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  642  		}
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  643  		if (mce_log->sub_err_type & 0x80)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  644  			eaddr =3D be64_to_cpu(mce_log->effective_address);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  645  		break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  646  	case MC_ERROR_TYPE_TLB:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  647  		mce_err.error_type =3D MCE_ERROR_TYPE_TLB;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  648  		switch (err_sub_type) {
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  649  		case MC_ERROR_TLB_PARITY:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  650  			mce_err.u.tlb_error_type =3D MCE_TLB_ERROR_PARITY;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  651  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  652  		case MC_ERROR_TLB_MULTIHIT:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  653  			mce_err.u.tlb_error_type =3D MCE_TLB_ERROR_MULTIHIT;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  654  			break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  655  		case MC_ERROR_TLB_INDETERMINATE:
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  656  		default:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  657  			mce_err.u.tlb_error_type =3D MCE_TLB_ERROR_INDETERMINATE;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  658  			break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  659  		}
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  660  		if (mce_log->sub_err_type & 0x80)
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  661  			eaddr =3D be64_to_cpu(mce_log->effective_address);
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  662  		break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  663  	case MC_ERROR_TYPE_D_CACHE:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  664  		mce_err.error_type =3D MCE_ERROR_TYPE_DCACHE;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  665  		break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  666  	case MC_ERROR_TYPE_I_CACHE:
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  667  		mce_err.error_type =3D MCE_ERROR_TYPE_DCACHE;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  668  		break;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  669  	case MC_ERROR_TYPE_UNKNOWN:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  670  	default:
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  671  		mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
9ca766f9891d23 arch/powerpc/platforms/pseries/ras.c Nicholas Piggin   2019-=
08-02  672  		break;
8f0b80561f217e arch/powerpc/platforms/pseries/ras.c Mahesh Salgaonkar 2018-=
09-11  673  	}
3efc8c464c6707 arch/powerpc/platforms/pseries/ras.c Ganesh Goudar     2021-=
11-24  674  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4042371527767848551==--

