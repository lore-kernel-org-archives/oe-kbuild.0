Content-Type: multipart/mixed; boundary="===============0510530624136442309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/xgene_pmu.c:498:0: warning: syntax error [syntaxError]
Date: Tue, 21 Dec 2021 12:36:48 +0800
Message-ID: <202112211201.kd6FT9xb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0510530624136442309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: John Garry <john.garry@huawei.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   86085fe79e3c1a66e32f2acae0ae64f4cceb8d28
commit: e656972b69864348a747954ea187576808000c5a drivers/perf: Improve buil=
d test coverage
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/perf/xgene_pmu.c:498:0: warning: syntax error [syntaxError]
   =

   ^

vim +498 drivers/perf/xgene_pmu.c

c0f7f7acdecdd7 Hoan Tran 2017-06-22  486  =

c0f7f7acdecdd7 Hoan Tran 2017-06-22  487  static struct attribute *mcb_pmu_=
v3_events_attrs[] =3D {
c0f7f7acdecdd7 Hoan Tran 2017-06-22  488  	XGENE_PMU_EVENT_ATTR(cycle-count=
,			0x00),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  489  	XGENE_PMU_EVENT_ATTR(req-receive=
,			0x01),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  490  	XGENE_PMU_EVENT_ATTR(rd-req-recv=
,			0x02),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  491  	XGENE_PMU_EVENT_ATTR(rd-req-recv=
-2,			0x03),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  492  	XGENE_PMU_EVENT_ATTR(wr-req-recv=
,			0x04),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  493  	XGENE_PMU_EVENT_ATTR(wr-req-recv=
-2,			0x05),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  494  	XGENE_PMU_EVENT_ATTR(rd-req-sent=
-to-mcu,		0x06),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  495  	XGENE_PMU_EVENT_ATTR(rd-req-sent=
-to-mcu-2,		0x07),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  496  	XGENE_PMU_EVENT_ATTR(rd-req-sent=
-to-spec-mcu,		0x08),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  497  	XGENE_PMU_EVENT_ATTR(rd-req-sent=
-to-spec-mcu-2,		0x09),
c0f7f7acdecdd7 Hoan Tran 2017-06-22 @498  	XGENE_PMU_EVENT_ATTR(glbl-ack-re=
cv-for-rd-sent-to-spec-mcu, 0x0a),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  499  	XGENE_PMU_EVENT_ATTR(glbl-ack-go=
-recv-for-rd-sent-to-spec-mcu, 0x0b),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  500  	XGENE_PMU_EVENT_ATTR(glbl-ack-no=
go-recv-for-rd-sent-to-spec-mcu, 0x0c),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  501  	XGENE_PMU_EVENT_ATTR(glbl-ack-go=
-recv-any-rd-req,	0x0d),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  502  	XGENE_PMU_EVENT_ATTR(glbl-ack-go=
-recv-any-rd-req-2,	0x0e),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  503  	XGENE_PMU_EVENT_ATTR(wr-req-sent=
-to-mcu,		0x0f),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  504  	XGENE_PMU_EVENT_ATTR(gack-recv,	=
			0x10),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  505  	XGENE_PMU_EVENT_ATTR(rd-gack-rec=
v,			0x11),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  506  	XGENE_PMU_EVENT_ATTR(wr-gack-rec=
v,			0x12),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  507  	XGENE_PMU_EVENT_ATTR(cancel-rd-g=
ack,			0x13),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  508  	XGENE_PMU_EVENT_ATTR(cancel-wr-g=
ack,			0x14),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  509  	XGENE_PMU_EVENT_ATTR(mcb-csw-req=
-stall,			0x15),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  510  	XGENE_PMU_EVENT_ATTR(mcu-req-int=
f-blocked,		0x16),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  511  	XGENE_PMU_EVENT_ATTR(mcb-mcu-rd-=
intf-stall,		0x17),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  512  	XGENE_PMU_EVENT_ATTR(csw-rd-intf=
-blocked,		0x18),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  513  	XGENE_PMU_EVENT_ATTR(csw-local-a=
ck-intf-blocked,	0x19),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  514  	XGENE_PMU_EVENT_ATTR(mcu-req-tab=
le-full,		0x1a),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  515  	XGENE_PMU_EVENT_ATTR(mcu-stat-ta=
ble-full,		0x1b),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  516  	XGENE_PMU_EVENT_ATTR(mcu-wr-tabl=
e-full,			0x1c),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  517  	XGENE_PMU_EVENT_ATTR(mcu-rdrecei=
pt-resp,		0x1d),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  518  	XGENE_PMU_EVENT_ATTR(mcu-wrcompl=
ete-resp,		0x1e),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  519  	XGENE_PMU_EVENT_ATTR(mcu-retryac=
k-resp,			0x1f),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  520  	XGENE_PMU_EVENT_ATTR(mcu-pcrdgra=
nt-resp,		0x20),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  521  	XGENE_PMU_EVENT_ATTR(mcu-req-fro=
m-lastload,		0x21),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  522  	XGENE_PMU_EVENT_ATTR(mcu-req-fro=
m-bypass,		0x22),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  523  	XGENE_PMU_EVENT_ATTR(volt-droop-=
detect,			0x23),
c0f7f7acdecdd7 Hoan Tran 2017-06-22  524  	NULL,
c0f7f7acdecdd7 Hoan Tran 2017-06-22  525  };
c0f7f7acdecdd7 Hoan Tran 2017-06-22  526  =


:::::: The code at line 498 was first introduced by commit
:::::: c0f7f7acdecdd7cf9a19c0af5c3dc649e1b934f7 perf: xgene: Add support fo=
r SoC PMU version 3

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0510530624136442309==--

