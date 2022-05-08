Content-Type: multipart/mixed; boundary="===============3568281233708386139=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:fix-cec 1/5] drivers/media/cec/core/cec-pin.c:1291 cec_pin_adap_free() warn: variable dereferenced before check 'pin' (see line 1288)
Date: Sun, 08 May 2022 18:39:26 +0800
Message-ID: <202205081847.EPfgN3uq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3568281233708386139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git fix-cec
head:   dd36bee1793249cb2548e9a4b6c10a079a10037d
commit: bb541e5dcec111915f565b0cf8c3313f38bd72d8 [1/5] cec-pin: disabling t=
he adapter cannot call kthread_stop
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220508/202205081847.EPfgN3uq-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/cec/core/cec-pin.c:1291 cec_pin_adap_free() warn: variable de=
referenced before check 'pin' (see line 1288)

vim +/pin +1291 drivers/media/cec/core/cec-pin.c

ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
83  =

ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
84  static void cec_pin_adap_free(struct cec_adapter *adap)
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
85  {
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
86  	struct cec_pin *pin =3D adap->pin;
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
87  =

bb541e5dcec111 drivers/media/cec/core/cec-pin.c Hans Verkuil 2022-05-06 @12=
88  	if (pin->kthread)
bb541e5dcec111 drivers/media/cec/core/cec-pin.c Hans Verkuil 2022-05-06  12=
89  		kthread_stop(pin->kthread);
bb541e5dcec111 drivers/media/cec/core/cec-pin.c Hans Verkuil 2022-05-06  12=
90  	pin->kthread =3D NULL;
e2ed5024ac2bc2 drivers/media/cec/core/cec-pin.c Hans Verkuil 2022-03-17 @12=
91  	if (pin && pin->ops->free)
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
92  		pin->ops->free(adap);
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
93  	adap->pin =3D NULL;
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
94  	kfree(pin);
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
95  }
ea5c8ef296681b drivers/media/cec/cec-pin.c      Hans Verkuil 2017-07-11  12=
96  =


:::::: The code at line 1291 was first introduced by commit
:::::: e2ed5024ac2bc27d4bfc99fd58f5ab54de8fa965 media: cec: use call_op and=
 check for !unregistered

:::::: TO: Hans Verkuil <hverkuil-cisco@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3568281233708386139==--

