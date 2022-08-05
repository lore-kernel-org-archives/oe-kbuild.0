Content-Type: multipart/mixed; boundary="===============1540990656664300614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 27/48] target: core: fix parsing PR OUT TID
Date: Sat, 06 Aug 2022 04:01:16 +0800
Message-ID: <202208060306.OumJ9c0l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1540990656664300614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220803162857.27770-28-d.bogdanov@yadro.com>
References: <20220803162857.27770-28-d.bogdanov@yadro.com>
TO: Dmitry Bogdanov <d.bogdanov@yadro.com>

Hi Dmitry,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.19]
[also build test WARNING on linus/master next-20220805]
[cannot apply to mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Bogdanov/Targ=
et-cluster-implementation-over-DLM/20220804-003430
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-m031-20220803 (https://download.01.org/0day-ci/arch=
ive/20220806/202208060306.OumJ9c0l-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/target/target_core_fabric_lib.c:343 iscsi_parse_pr_out_transport_id=
() error: uninitialized symbol 'p'.
drivers/target/target_core_fabric_lib.c:424 target_parse_pr_out_transport_i=
d() warn: ignoring unreachable code.

vim +/p +343 drivers/target/target_core_fabric_lib.c

421431f2fd129f Dmitry Bogdanov    2022-06-29  267  =

421431f2fd129f Dmitry Bogdanov    2022-06-29  268  u32 iscsi_parse_pr_out_t=
ransport_id(
421431f2fd129f Dmitry Bogdanov    2022-06-29  269  	const char *buf,
421431f2fd129f Dmitry Bogdanov    2022-06-29  270  	char *initiatorname,
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  271  	char **port_nexus_ptr)
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  272  {
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  273  	char *p;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  274  	int i;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  275  	u8 format_code =3D (buf=
[0] & 0xc0);
421431f2fd129f Dmitry Bogdanov    2022-06-29  276  	u32 out_tid_len;
421431f2fd129f Dmitry Bogdanov    2022-06-29  277  =

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  278  	/*
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  279  	 * Check for FORMAT COD=
E 00b or 01b from spc4r17, section 7.5.4.6:
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  280  	 *
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  281  	 *       TransportID fo=
r initiator ports using SCSI over iSCSI,
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  282  	 *       from Table 388=
 -- iSCSI TransportID formats.
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  283  	 *
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  284  	 *    00b     Initiator=
 port is identified using the world wide unique
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  285  	 *            SCSI devi=
ce name of the iSCSI initiator
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  286  	 *            device co=
ntaining the initiator port (see table 389).
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  287  	 *    01b     Initiator=
 port is identified using the world wide unique
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  288  	 *            initiator=
 port identifier (see table 390).10b to 11b
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  289  	 *            Reserved
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  290  	 */
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  291  	if ((format_code !=3D 0=
x00) && (format_code !=3D 0x40)) {
6708bb27bb2703 Andy Grover        2011-06-08  292  		pr_err("Illegal format=
 code: 0x%02x for iSCSI"
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  293  			" Initiator Transport=
 ID\n", format_code);
421431f2fd129f Dmitry Bogdanov    2022-06-29  294  		return 0;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  295  	}
68edbce4fb4b17 Joern Engel        2014-09-02  296  	/* The shift works than=
ks to integer promotion rules */
421431f2fd129f Dmitry Bogdanov    2022-06-29  297  	out_tid_len =3D get_una=
ligned_be16(&buf[2]);
169622eee4373d Mike Christie      2020-07-01  298  =

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  299  	/*
35d1efe80500a5 Masanari Iida      2012-08-16  300  	 * Check for ',i,0x' se=
parator between iSCSI Name and iSCSI Initiator
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  301  	 * Session ID as define=
d in Table 390 - iSCSI initiator port TransportID
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  302  	 * format.
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  303  	 */
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  304  	if (format_code =3D=3D =
0x40) {
8359cf43b9dccd J=C3=B6rn Engel         2011-11-24  305  		p =3D strstr(&buf=
[4], ",i,0x");
6708bb27bb2703 Andy Grover        2011-06-08  306  		if (!p) {
35d1efe80500a5 Masanari Iida      2012-08-16  307  			pr_err("Unable to loc=
ate \",i,0x\" separator"
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  308  				" for Initiator port=
 identifier: %s\n",
8359cf43b9dccd J=C3=B6rn Engel         2011-11-24  309  				&buf[4]);
421431f2fd129f Dmitry Bogdanov    2022-06-29  310  			return 0;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  311  		}
421431f2fd129f Dmitry Bogdanov    2022-06-29  312  		memcpy(initiatorname, =
&buf[4], p - buf - 4);
421431f2fd129f Dmitry Bogdanov    2022-06-29  313  		initiatorname[p - buf =
- 4] =3D '\0'; /* Terminate iSCSI Name */
35d1efe80500a5 Masanari Iida      2012-08-16  314  		p +=3D 5; /* Skip over=
 ",i,0x" separator */
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  315  =

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  316  		*port_nexus_ptr =3D p;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  317  		/*
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  318  		 * Go ahead and do the=
 lower case conversion of the received
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  319  		 * 12 ASCII characters=
 representing the ISID in the TransportID
25985edcedea63 Lucas De Marchi    2011-03-30  320  		 * for comparison agai=
nst the running iSCSI session's ISID from
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  321  		 * iscsi_target.c:lio_=
sess_get_initiator_sid()
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  322  		 */
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  323  		for (i =3D 0; i < 12; =
i++) {
639341bf8836f2 Mike Christie      2020-07-01  324  			/*
639341bf8836f2 Mike Christie      2020-07-01  325  			 * The first ISCSI IN=
ITIATOR SESSION ID field byte
639341bf8836f2 Mike Christie      2020-07-01  326  			 * containing an ASCI=
I null character terminates the
639341bf8836f2 Mike Christie      2020-07-01  327  			 * ISCSI INITIATOR SE=
SSION ID field without regard for
639341bf8836f2 Mike Christie      2020-07-01  328  			 * the specified leng=
th of the iSCSI TransportID or the
639341bf8836f2 Mike Christie      2020-07-01  329  			 * contents of the AD=
DITIONAL LENGTH field.
639341bf8836f2 Mike Christie      2020-07-01  330  			 */
639341bf8836f2 Mike Christie      2020-07-01  331  			if (*p =3D=3D '\0')
639341bf8836f2 Mike Christie      2020-07-01  332  				break;
639341bf8836f2 Mike Christie      2020-07-01  333  =

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  334  			if (isdigit(*p)) {
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  335  				p++;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  336  				continue;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  337  			}
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  338  			*p =3D tolower(*p);
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  339  			p++;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  340  		}
421431f2fd129f Dmitry Bogdanov    2022-06-29  341  	} else {
421431f2fd129f Dmitry Bogdanov    2022-06-29  342  		strscpy(initiatorname,=
 &buf[4], out_tid_len);
421431f2fd129f Dmitry Bogdanov    2022-06-29 @343  		initiatorname[p - buf]=
 =3D '\0'; /* Terminate iSCSI Name */
13ef143ddd93a5 Bodo Stroesser     2020-04-08  344  		*port_nexus_ptr =3D NU=
LL;
421431f2fd129f Dmitry Bogdanov    2022-06-29  345  	}
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  346  =

421431f2fd129f Dmitry Bogdanov    2022-06-29  347  	/* Add four bytes for i=
SCSI Transport ID header */
421431f2fd129f Dmitry Bogdanov    2022-06-29  348  	out_tid_len +=3D 4;
421431f2fd129f Dmitry Bogdanov    2022-06-29  349  =

421431f2fd129f Dmitry Bogdanov    2022-06-29  350  	return out_tid_len;
c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  351  }
2650d71e244fb3 Christoph Hellwig  2015-05-01  352  =

879815a20d04fa Dmitry Bogdanov    2022-07-27  353  int target_get_pr_transp=
ort_id_len(struct t10_pr_registration *pr_reg)
2650d71e244fb3 Christoph Hellwig  2015-05-01  354  {
879815a20d04fa Dmitry Bogdanov    2022-07-27  355  	switch (pr_reg->pr_tid[=
0] & 0xF) {
2650d71e244fb3 Christoph Hellwig  2015-05-01  356  	case SCSI_PROTOCOL_FCP:
2650d71e244fb3 Christoph Hellwig  2015-05-01  357  	case SCSI_PROTOCOL_SBP:
2650d71e244fb3 Christoph Hellwig  2015-05-01  358  	case SCSI_PROTOCOL_SRP:
2650d71e244fb3 Christoph Hellwig  2015-05-01  359  	case SCSI_PROTOCOL_SAS:
879815a20d04fa Dmitry Bogdanov    2022-07-27  360  		return 24;
2650d71e244fb3 Christoph Hellwig  2015-05-01  361  	case SCSI_PROTOCOL_ISCS=
I:
879815a20d04fa Dmitry Bogdanov    2022-07-27  362  		return get_unaligned_b=
e16(&pr_reg->pr_tid[2]) + 4;
2650d71e244fb3 Christoph Hellwig  2015-05-01  363  	default:
879815a20d04fa Dmitry Bogdanov    2022-07-27  364  		WARN(1, "Unknown proto=
_id: %#x\n", pr_reg->pr_tid[0] & 0xF);
2650d71e244fb3 Christoph Hellwig  2015-05-01  365  		return -EINVAL;
2650d71e244fb3 Christoph Hellwig  2015-05-01  366  	}
2650d71e244fb3 Christoph Hellwig  2015-05-01  367  }
2650d71e244fb3 Christoph Hellwig  2015-05-01  368  =

46be2a3c945e34 Dmitry Bogdanov    2021-12-24  369  int target_get_pr_transp=
ort_id(
879815a20d04fa Dmitry Bogdanov    2022-07-27  370  		struct t10_pr_registra=
tion *pr_reg,
2650d71e244fb3 Christoph Hellwig  2015-05-01  371  		unsigned char *buf)
2650d71e244fb3 Christoph Hellwig  2015-05-01  372  {
879815a20d04fa Dmitry Bogdanov    2022-07-27  373  	int len =3D  target_get=
_pr_transport_id_len(pr_reg);
879815a20d04fa Dmitry Bogdanov    2022-07-27  374  =

879815a20d04fa Dmitry Bogdanov    2022-07-27  375  	if (len > 0)
879815a20d04fa Dmitry Bogdanov    2022-07-27  376  		memcpy(buf, pr_reg->pr=
_tid, len);
879815a20d04fa Dmitry Bogdanov    2022-07-27  377  =

879815a20d04fa Dmitry Bogdanov    2022-07-27  378  	return  len;
879815a20d04fa Dmitry Bogdanov    2022-07-27  379  }
879815a20d04fa Dmitry Bogdanov    2022-07-27  380  =

879815a20d04fa Dmitry Bogdanov    2022-07-27  381  int target_gen_pr_transp=
ort_id(
879815a20d04fa Dmitry Bogdanov    2022-07-27  382  	struct t10_pr_registrat=
ion *pr_reg,
879815a20d04fa Dmitry Bogdanov    2022-07-27  383  	int proto_id,
879815a20d04fa Dmitry Bogdanov    2022-07-27  384  	const char *initiatorna=
me,
879815a20d04fa Dmitry Bogdanov    2022-07-27  385  	unsigned char *isid)
879815a20d04fa Dmitry Bogdanov    2022-07-27  386  {
879815a20d04fa Dmitry Bogdanov    2022-07-27  387  =

879815a20d04fa Dmitry Bogdanov    2022-07-27  388  	switch (proto_id) {
2650d71e244fb3 Christoph Hellwig  2015-05-01  389  	case SCSI_PROTOCOL_SAS:
879815a20d04fa Dmitry Bogdanov    2022-07-27  390  		return sas_get_pr_tran=
sport_id(initiatorname, pr_reg->pr_tid);
2650d71e244fb3 Christoph Hellwig  2015-05-01  391  	case SCSI_PROTOCOL_SBP:
879815a20d04fa Dmitry Bogdanov    2022-07-27  392  		return sbp_get_pr_tran=
sport_id(initiatorname, pr_reg->pr_tid);
2650d71e244fb3 Christoph Hellwig  2015-05-01  393  	case SCSI_PROTOCOL_SRP:
879815a20d04fa Dmitry Bogdanov    2022-07-27  394  		return srp_get_pr_tran=
sport_id(initiatorname, pr_reg->pr_tid);
2650d71e244fb3 Christoph Hellwig  2015-05-01  395  	case SCSI_PROTOCOL_FCP:
879815a20d04fa Dmitry Bogdanov    2022-07-27  396  		return fc_get_pr_trans=
port_id(initiatorname, pr_reg->pr_tid);
2650d71e244fb3 Christoph Hellwig  2015-05-01  397  	case SCSI_PROTOCOL_ISCS=
I:
879815a20d04fa Dmitry Bogdanov    2022-07-27  398  		return iscsi_get_pr_tr=
ansport_id(initiatorname, isid, pr_reg->pr_tid);
2650d71e244fb3 Christoph Hellwig  2015-05-01  399  	default:
879815a20d04fa Dmitry Bogdanov    2022-07-27  400  		pr_err("Unknown proto_=
id: 0x%02x\n", proto_id);
2650d71e244fb3 Christoph Hellwig  2015-05-01  401  		return -EINVAL;
2650d71e244fb3 Christoph Hellwig  2015-05-01  402  	}
2650d71e244fb3 Christoph Hellwig  2015-05-01  403  }
2650d71e244fb3 Christoph Hellwig  2015-05-01  404  =

421431f2fd129f Dmitry Bogdanov    2022-06-29  405  u32 target_parse_pr_out_=
transport_id(
421431f2fd129f Dmitry Bogdanov    2022-06-29  406  	const char *buf, char *=
initiatorname, char **port_nexus_ptr)
2650d71e244fb3 Christoph Hellwig  2015-05-01  407  {
421431f2fd129f Dmitry Bogdanov    2022-06-29  408  	switch (buf[0] & 0xF) {
2650d71e244fb3 Christoph Hellwig  2015-05-01  409  	case SCSI_PROTOCOL_SAS:
421431f2fd129f Dmitry Bogdanov    2022-06-29  410  		return sas_parse_pr_ou=
t_transport_id(buf, initiatorname, port_nexus_ptr);
2650d71e244fb3 Christoph Hellwig  2015-05-01  411  	case SCSI_PROTOCOL_SBP:
421431f2fd129f Dmitry Bogdanov    2022-06-29  412  		return sbp_parse_pr_ou=
t_transport_id(buf, initiatorname, port_nexus_ptr);
2650d71e244fb3 Christoph Hellwig  2015-05-01  413  	case SCSI_PROTOCOL_SRP:
421431f2fd129f Dmitry Bogdanov    2022-06-29  414  		return srp_parse_pr_ou=
t_transport_id(buf, initiatorname, port_nexus_ptr);
2650d71e244fb3 Christoph Hellwig  2015-05-01  415  	case SCSI_PROTOCOL_FCP:
421431f2fd129f Dmitry Bogdanov    2022-06-29  416  		return fc_parse_pr_out=
_transport_id(buf, initiatorname, port_nexus_ptr);
2650d71e244fb3 Christoph Hellwig  2015-05-01  417  	case SCSI_PROTOCOL_ISCS=
I:
421431f2fd129f Dmitry Bogdanov    2022-06-29  418  		return iscsi_parse_pr_=
out_transport_id(buf, initiatorname, port_nexus_ptr);
2650d71e244fb3 Christoph Hellwig  2015-05-01  419  	default:
421431f2fd129f Dmitry Bogdanov    2022-06-29  420  		pr_err("Unknown proto_=
id: 0x%02x\n", buf[0] & 0xF);
421431f2fd129f Dmitry Bogdanov    2022-06-29  421  		return 0;
2650d71e244fb3 Christoph Hellwig  2015-05-01  422  	}
2650d71e244fb3 Christoph Hellwig  2015-05-01  423  =

2650d71e244fb3 Christoph Hellwig  2015-05-01 @424  	*port_nexus_ptr =3D NUL=
L;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1540990656664300614==--

