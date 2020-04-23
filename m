Content-Type: multipart/mixed; boundary="===============2609342052767572731=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [mchinth:sep_socwatch_linux_5_7 32/34] drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: warning: cast removes address space '<asn:2>' of expression
Date: Thu, 23 Apr 2020 11:44:10 +0800
Message-ID: <202004231105.2psBdj4A%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2609342052767572731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
CC: Faycal Benmlih <faycal.benmlih@intel.com>

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_7
head:   d0b187de0054ca718a325a5e30511873147ef526
commit: 7f5608705621881d44c6df4cd64516757a6d03d6 [32/34] SEP/SOCWATCH resol=
ve build errors after rebasing to linux v5.6-rc3
reproduce:
        # apt-get install sparse
        # sparse version: =

        git checkout 7f5608705621881d44c6df4cd64516757a6d03d6
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:242:28: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:245:58: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_punitInterfa=
ceAddr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_punitDataAddr
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:    got unsigned=
 long long volatile [usertype] *ssram_virt_addr
   drivers/platform/x86/socwatch/sw_telem.c:280:28: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:283:28: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:286:29: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:289:29: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:292:56: sparse: warning: cast r=
emoves address space '<asn:2>' of expression
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_pmcIPCCmdAddr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_pmcIPCStsAddr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_pmcIPCWBufAd=
dr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] [assigned] s_pmcIPCRBufAd=
dr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse: warning: incorr=
ect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:    got unsigned=
 long long volatile [usertype] *ssram_virt_addr
   drivers/platform/x86/socwatch/sw_telem.c:671:5: sparse: warning: symbol =
'read_telem' was not declared. Should it be static?

# https://github.com/mchinth/linux/commit/7f5608705621881d44c6df4cd64516757=
a6d03d6
git remote add mchinth https://github.com/mchinth/linux
git remote update mchinth
git checkout 7f5608705621881d44c6df4cd64516757a6d03d6
vim +239 drivers/platform/x86/socwatch/sw_telem.c

e62dab7842638a Faycal Benmlih       2019-04-23  231  =

e62dab7842638a Faycal Benmlih       2019-04-23  232  /**
e62dab7842638a Faycal Benmlih       2019-04-23  233   * setup_punit_mbox --=
 Setup P-Unit virtual mappings
b0cc42c089f7fc Jon Moeller          2018-11-13  234   *
e62dab7842638a Faycal Benmlih       2019-04-23  235   * Returns: true if se=
tup successfully
e62dab7842638a Faycal Benmlih       2019-04-23  236   */
e62dab7842638a Faycal Benmlih       2019-04-23  237  static bool setup_puni=
t_mbox(void)
e62dab7842638a Faycal Benmlih       2019-04-23  238  {
7f560870562188 Manisha Chinthapally 2020-02-25 @239  	s_punitInterfaceAddr =
=3D (u64 *)ioremap_cache(
e62dab7842638a Faycal Benmlih       2019-04-23  240  				(unsigned long)s_m=
chBarAddrs[TELEM_MCHBAR_CFG] +
e62dab7842638a Faycal Benmlih       2019-04-23  241  				PUNIT_MAILBOX_INTE=
RFACE_OFFSET, 0x4);
7f560870562188 Manisha Chinthapally 2020-02-25  242  	s_punitDataAddr =3D (=
u64 *)ioremap_cache(
e62dab7842638a Faycal Benmlih       2019-04-23  243  				(unsigned long)s_m=
chBarAddrs[TELEM_MCHBAR_CFG] +
e62dab7842638a Faycal Benmlih       2019-04-23  244  				PUNIT_MAILBOX_DATA=
_OFFSET, 0x4);
7f560870562188 Manisha Chinthapally 2020-02-25  245  	s_telemEventInfo[TELE=
M_PUNIT].ssram_virt_addr =3D (u64 *)ioremap_cache(
e62dab7842638a Faycal Benmlih       2019-04-23  246  				(unsigned long)
e62dab7842638a Faycal Benmlih       2019-04-23  247  					s_mchBarAddrs[TEL=
EM_SSRAMBAR_CFG] +
e62dab7842638a Faycal Benmlih       2019-04-23  248  				PSS_TELEM_SSRAM_OF=
FSET, TELEM_SSRAM_SIZE);
e62dab7842638a Faycal Benmlih       2019-04-23  249  =

e62dab7842638a Faycal Benmlih       2019-04-23  250  	return (s_punitInterf=
aceAddr && s_punitDataAddr &&
e62dab7842638a Faycal Benmlih       2019-04-23  251  		s_telemEventInfo[TEL=
EM_PUNIT].ssram_virt_addr);
e62dab7842638a Faycal Benmlih       2019-04-23  252  }
e62dab7842638a Faycal Benmlih       2019-04-23  253  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2609342052767572731==--

