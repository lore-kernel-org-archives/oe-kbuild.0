Content-Type: multipart/mixed; boundary="===============8103344133339262122=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/mce.c:551:7: warning: %llx in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
Date: Mon, 25 Oct 2021 16:31:06 +0800
Message-ID: <202110251650.tocCXaFT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8103344133339262122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "C=C3=A9dric Le Goater" <clg@kaod.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   87066fdd2e30fe9dd531125d95257c118a74617e
commit: 1cc2fd75934454be024cd7609b6d7890de6e724b powerpc/mce: Include proto=
types
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/mce.c:551:7: warning: %llx in format string (no. 1) =
requires 'unsigned long long' but the argument type is 'unsigned long'. [in=
validPrintfArgType_uint]
     n =3D sprintf(dar_str, "DAR: %016llx ", ea);
         ^
   arch/powerpc/kernel/mce.c:553:4: warning: %llx in format string (no. 1) =
requires 'unsigned long long' but the argument type is 'unsigned long'. [in=
validPrintfArgType_uint]
      sprintf(dar_str + n, "paddr: %016llx ", pa);
      ^
   arch/powerpc/kernel/mce.c:555:3: warning: %llx in format string (no. 1) =
requires 'unsigned long long' but the argument type is 'unsigned long'. [in=
validPrintfArgType_uint]
     sprintf(pa_str, " paddr: %016llx", pa);
     ^

vim +551 arch/powerpc/kernel/mce.c

b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  355  =

63f44d65143976 Michael Ellerman  2017-04-03  356  void machine_check_print_=
event_info(struct machine_check_event *evt,
c05772018491e5 Paul Mackerras    2019-02-21  357  				    bool user_mode, b=
ool in_guest)
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  358  {
9ca766f9891d23 Nicholas Piggin   2019-08-02  359  	const char *level, *sevs=
tr, *subtype, *err_type, *initiator;
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  360  	uint64_t ea =3D 0, pa =
=3D 0;
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  361  	int n =3D 0;
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  362  	char dar_str[50];
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  363  	char pa_str[50];
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  364  	static const char *mc_ue=
_types[] =3D {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  365  		"Indeterminate",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  366  		"Instruction fetch",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  367  		"Page table walk ifetch=
",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  368  		"Load/Store",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  369  		"Page table walk Load/S=
tore",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  370  	};
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  371  	static const char *mc_sl=
b_types[] =3D {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  372  		"Indeterminate",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  373  		"Parity",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  374  		"Multihit",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  375  	};
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  376  	static const char *mc_er=
at_types[] =3D {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  377  		"Indeterminate",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  378  		"Parity",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  379  		"Multihit",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  380  	};
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  381  	static const char *mc_tl=
b_types[] =3D {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  382  		"Indeterminate",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  383  		"Parity",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  384  		"Multihit",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  385  	};
7b9f71f974a127 Nicholas Piggin   2017-02-28  386  	static const char *mc_us=
er_types[] =3D {
7b9f71f974a127 Nicholas Piggin   2017-02-28  387  		"Indeterminate",
7b9f71f974a127 Nicholas Piggin   2017-02-28  388  		"tlbie(l) invalid",
201220bb0e8cbc Nicholas Piggin   2020-07-03  389  		"scv invalid",
7b9f71f974a127 Nicholas Piggin   2017-02-28  390  	};
7b9f71f974a127 Nicholas Piggin   2017-02-28  391  	static const char *mc_ra=
_types[] =3D {
7b9f71f974a127 Nicholas Piggin   2017-02-28  392  		"Indeterminate",
7b9f71f974a127 Nicholas Piggin   2017-02-28  393  		"Instruction fetch (bad=
)",
90df4bfb4d9e00 Nicholas Piggin   2017-05-29  394  		"Instruction fetch (for=
eign)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  395  		"Page table walk ifetch=
 (bad)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  396  		"Page table walk ifetch=
 (foreign)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  397  		"Load (bad)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  398  		"Store (bad)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  399  		"Page table walk Load/S=
tore (bad)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  400  		"Page table walk Load/S=
tore (foreign)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  401  		"Load/Store (foreign)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  402  	};
7b9f71f974a127 Nicholas Piggin   2017-02-28  403  	static const char *mc_li=
nk_types[] =3D {
7b9f71f974a127 Nicholas Piggin   2017-02-28  404  		"Indeterminate",
7b9f71f974a127 Nicholas Piggin   2017-02-28  405  		"Instruction fetch (tim=
eout)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  406  		"Page table walk ifetch=
 (timeout)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  407  		"Load (timeout)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  408  		"Store (timeout)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  409  		"Page table walk Load/S=
tore (timeout)",
7b9f71f974a127 Nicholas Piggin   2017-02-28  410  	};
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  411  	static const char *mc_er=
ror_class[] =3D {
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  412  		"Unknown",
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  413  		"Hardware error",
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  414  		"Probable Hardware erro=
r (some chance of software cause)",
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  415  		"Software error",
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  416  		"Probable Software erro=
r (some chance of hardware cause)",
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  417  	};
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  418  =

b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  419  	/* Print things out */
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  420  	if (evt->version !=3D MC=
E_V1) {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  421  		pr_err("Machine Check E=
xception, Unknown event version %d !\n",
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  422  		       evt->version);
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  423  		return;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  424  	}
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  425  	switch (evt->severity) {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  426  	case MCE_SEV_NO_ERROR:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  427  		level =3D KERN_INFO;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  428  		sevstr =3D "Harmless";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  429  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  430  	case MCE_SEV_WARNING:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  431  		level =3D KERN_WARNING;
cda6618d060b5e Mahesh Salgaonkar 2019-04-29  432  		sevstr =3D "Warning";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  433  		break;
cda6618d060b5e Mahesh Salgaonkar 2019-04-29  434  	case MCE_SEV_SEVERE:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  435  		level =3D KERN_ERR;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  436  		sevstr =3D "Severe";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  437  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  438  	case MCE_SEV_FATAL:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  439  	default:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  440  		level =3D KERN_ERR;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  441  		sevstr =3D "Fatal";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  442  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  443  	}
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  444  =

9ca766f9891d23 Nicholas Piggin   2019-08-02  445  	switch(evt->initiator) {
9ca766f9891d23 Nicholas Piggin   2019-08-02  446  	case MCE_INITIATOR_CPU:
9ca766f9891d23 Nicholas Piggin   2019-08-02  447  		initiator =3D "CPU";
9ca766f9891d23 Nicholas Piggin   2019-08-02  448  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  449  	case MCE_INITIATOR_PCI:
9ca766f9891d23 Nicholas Piggin   2019-08-02  450  		initiator =3D "PCI";
9ca766f9891d23 Nicholas Piggin   2019-08-02  451  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  452  	case MCE_INITIATOR_ISA:
9ca766f9891d23 Nicholas Piggin   2019-08-02  453  		initiator =3D "ISA";
9ca766f9891d23 Nicholas Piggin   2019-08-02  454  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  455  	case MCE_INITIATOR_MEMOR=
Y:
9ca766f9891d23 Nicholas Piggin   2019-08-02  456  		initiator =3D "Memory";
9ca766f9891d23 Nicholas Piggin   2019-08-02  457  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  458  	case MCE_INITIATOR_POWER=
MGM:
9ca766f9891d23 Nicholas Piggin   2019-08-02  459  		initiator =3D "Power Ma=
nagement";
9ca766f9891d23 Nicholas Piggin   2019-08-02  460  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  461  	case MCE_INITIATOR_UNKNO=
WN:
9ca766f9891d23 Nicholas Piggin   2019-08-02  462  	default:
9ca766f9891d23 Nicholas Piggin   2019-08-02  463  		initiator =3D "Unknown";
9ca766f9891d23 Nicholas Piggin   2019-08-02  464  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  465  	}
9ca766f9891d23 Nicholas Piggin   2019-08-02  466  =

b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  467  	switch (evt->error_type)=
 {
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  468  	case MCE_ERROR_TYPE_UE:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  469  		err_type =3D "UE";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  470  		subtype =3D evt->u.ue_e=
rror.ue_error_type <
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  471  			ARRAY_SIZE(mc_ue_types=
) ?
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  472  			mc_ue_types[evt->u.ue_=
error.ue_error_type]
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  473  			: "Unknown";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  474  		if (evt->u.ue_error.eff=
ective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  475  			ea =3D evt->u.ue_error=
.effective_address;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  476  		if (evt->u.ue_error.phy=
sical_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  477  			pa =3D evt->u.ue_error=
.physical_address;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  478  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  479  	case MCE_ERROR_TYPE_SLB:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  480  		err_type =3D "SLB";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  481  		subtype =3D evt->u.slb_=
error.slb_error_type <
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  482  			ARRAY_SIZE(mc_slb_type=
s) ?
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  483  			mc_slb_types[evt->u.sl=
b_error.slb_error_type]
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  484  			: "Unknown";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  485  		if (evt->u.slb_error.ef=
fective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  486  			ea =3D evt->u.slb_erro=
r.effective_address;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  487  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  488  	case MCE_ERROR_TYPE_ERAT:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  489  		err_type =3D "ERAT";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  490  		subtype =3D evt->u.erat=
_error.erat_error_type <
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  491  			ARRAY_SIZE(mc_erat_typ=
es) ?
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  492  			mc_erat_types[evt->u.e=
rat_error.erat_error_type]
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  493  			: "Unknown";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  494  		if (evt->u.erat_error.e=
ffective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  495  			ea =3D evt->u.erat_err=
or.effective_address;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  496  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  497  	case MCE_ERROR_TYPE_TLB:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  498  		err_type =3D "TLB";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  499  		subtype =3D evt->u.tlb_=
error.tlb_error_type <
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  500  			ARRAY_SIZE(mc_tlb_type=
s) ?
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  501  			mc_tlb_types[evt->u.tl=
b_error.tlb_error_type]
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  502  			: "Unknown";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  503  		if (evt->u.tlb_error.ef=
fective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  504  			ea =3D evt->u.tlb_erro=
r.effective_address;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  505  		break;
7b9f71f974a127 Nicholas Piggin   2017-02-28  506  	case MCE_ERROR_TYPE_USER:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  507  		err_type =3D "User";
7b9f71f974a127 Nicholas Piggin   2017-02-28  508  		subtype =3D evt->u.user=
_error.user_error_type <
7b9f71f974a127 Nicholas Piggin   2017-02-28  509  			ARRAY_SIZE(mc_user_typ=
es) ?
7b9f71f974a127 Nicholas Piggin   2017-02-28  510  			mc_user_types[evt->u.u=
ser_error.user_error_type]
7b9f71f974a127 Nicholas Piggin   2017-02-28  511  			: "Unknown";
7b9f71f974a127 Nicholas Piggin   2017-02-28  512  		if (evt->u.user_error.e=
ffective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  513  			ea =3D evt->u.user_err=
or.effective_address;
7b9f71f974a127 Nicholas Piggin   2017-02-28  514  		break;
7b9f71f974a127 Nicholas Piggin   2017-02-28  515  	case MCE_ERROR_TYPE_RA:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  516  		err_type =3D "Real addr=
ess";
7b9f71f974a127 Nicholas Piggin   2017-02-28  517  		subtype =3D evt->u.ra_e=
rror.ra_error_type <
7b9f71f974a127 Nicholas Piggin   2017-02-28  518  			ARRAY_SIZE(mc_ra_types=
) ?
7b9f71f974a127 Nicholas Piggin   2017-02-28  519  			mc_ra_types[evt->u.ra_=
error.ra_error_type]
7b9f71f974a127 Nicholas Piggin   2017-02-28  520  			: "Unknown";
7b9f71f974a127 Nicholas Piggin   2017-02-28  521  		if (evt->u.ra_error.eff=
ective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  522  			ea =3D evt->u.ra_error=
.effective_address;
7b9f71f974a127 Nicholas Piggin   2017-02-28  523  		break;
7b9f71f974a127 Nicholas Piggin   2017-02-28  524  	case MCE_ERROR_TYPE_LINK:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  525  		err_type =3D "Link";
7b9f71f974a127 Nicholas Piggin   2017-02-28  526  		subtype =3D evt->u.link=
_error.link_error_type <
7b9f71f974a127 Nicholas Piggin   2017-02-28  527  			ARRAY_SIZE(mc_link_typ=
es) ?
7b9f71f974a127 Nicholas Piggin   2017-02-28  528  			mc_link_types[evt->u.l=
ink_error.link_error_type]
7b9f71f974a127 Nicholas Piggin   2017-02-28  529  			: "Unknown";
7b9f71f974a127 Nicholas Piggin   2017-02-28  530  		if (evt->u.link_error.e=
ffective_address_provided)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  531  			ea =3D evt->u.link_err=
or.effective_address;
7b9f71f974a127 Nicholas Piggin   2017-02-28  532  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  533  	case MCE_ERROR_TYPE_DCAC=
HE:
9ca766f9891d23 Nicholas Piggin   2019-08-02  534  		err_type =3D "D-Cache";
9ca766f9891d23 Nicholas Piggin   2019-08-02  535  		subtype =3D "Unknown";
9ca766f9891d23 Nicholas Piggin   2019-08-02  536  		break;
9ca766f9891d23 Nicholas Piggin   2019-08-02  537  	case MCE_ERROR_TYPE_ICAC=
HE:
9ca766f9891d23 Nicholas Piggin   2019-08-02  538  		err_type =3D "I-Cache";
9ca766f9891d23 Nicholas Piggin   2019-08-02  539  		subtype =3D "Unknown";
9ca766f9891d23 Nicholas Piggin   2019-08-02  540  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  541  	default:
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  542  	case MCE_ERROR_TYPE_UNKN=
OWN:
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  543  		err_type =3D "Unknown";
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  544  		subtype =3D "";
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  545  		break;
b5ff4211a8294b Mahesh Salgaonkar 2013-10-30  546  	}
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  547  =

d6e8a150850601 Mahesh Salgaonkar 2019-04-29  548  	dar_str[0] =3D pa_str[0]=
 =3D '\0';
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  549  	if (ea && evt->srr0 !=3D=
 ea) {
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  550  		/* Load/Store address */
d6e8a150850601 Mahesh Salgaonkar 2019-04-29 @551  		n =3D sprintf(dar_str, =
"DAR: %016llx ", ea);
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  552  		if (pa)
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  553  			sprintf(dar_str + n, "=
paddr: %016llx ", pa);
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  554  	} else if (pa) {
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  555  		sprintf(pa_str, " paddr=
: %016llx", pa);
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  556  	}
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  557  =

d6e8a150850601 Mahesh Salgaonkar 2019-04-29  558  	printk("%sMCE: CPU%d: ma=
chine check (%s) %s %s %s %s[%s]\n",
4a869531ddbf59 Nicholas Piggin   2020-11-28  559  		level, evt->cpu, sevstr=
, in_guest ? "Guest" : "",
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  560  		err_type, subtype, dar_=
str,
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  561  		evt->disposition =3D=3D=
 MCE_DISPOSITION_RECOVERED ?
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  562  		"Recovered" : "Not reco=
vered");
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  563  =

d6e8a150850601 Mahesh Salgaonkar 2019-04-29  564  	if (in_guest || user_mod=
e) {
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  565  		printk("%sMCE: CPU%d: P=
ID: %d Comm: %s %sNIP: [%016llx]%s\n",
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  566  			level, evt->cpu, curre=
nt->pid, current->comm,
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  567  			in_guest ? "Guest " : =
"", evt->srr0, pa_str);
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  568  	} else {
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  569  		printk("%sMCE: CPU%d: N=
IP: [%016llx] %pS%s\n",
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  570  			level, evt->cpu, evt->=
srr0, (void *)evt->srr0, pa_str);
d6e8a150850601 Mahesh Salgaonkar 2019-04-29  571  	}
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  572  =

9ca766f9891d23 Nicholas Piggin   2019-08-02  573  	printk("%sMCE: CPU%d: In=
itiator %s\n", level, evt->cpu, initiator);
9ca766f9891d23 Nicholas Piggin   2019-08-02  574  =

50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  575  	subtype =3D evt->error_c=
lass < ARRAY_SIZE(mc_error_class) ?
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  576  		mc_error_class[evt->err=
or_class] : "Unknown";
50dbabe06a6e1c Mahesh Salgaonkar 2019-04-29  577  	printk("%sMCE: CPU%d: %s=
\n", level, evt->cpu, subtype);
7290f3b3d3e66b Nicholas Piggin   2019-08-02  578  =


:::::: The code at line 551 was first introduced by commit
:::::: d6e8a150850601277039a548ffcdddd1bfe3e365 powerpc/powernv/mce: Reduce=
 MCE console logs to lesser lines.

:::::: TO: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8103344133339262122==--

