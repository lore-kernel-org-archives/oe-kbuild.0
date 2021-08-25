Content-Type: multipart/mixed; boundary="===============3016400058184842777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/dvb-frontends/mxl692.c:135:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Wed, 25 Aug 2021 14:52:18 +0800
Message-ID: <202108251409.ApANJ7kK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3016400058184842777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Brad Love <brad@nextdimension.cc>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sean Young <sean@mess.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6e764bcd1cf72a2846c0e53d3975a09b242c04c9
commit: b53f2fa136b1b20f03184f4a98fea75eb2705eac media: mxl692: MaxLinear 6=
92 ATSC demod/tuner driver
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/dvb-frontends/mxl692.c:135:3: warning: Assignment of funct=
ion parameter has no effect outside the function. Did you forget dereferenc=
ing it? [uselessAssignmentPtrArg]
     buffer +=3D convert_endian(2 * sizeof(u32), buffer);
     ^
   drivers/media/dvb-frontends/mxl692.c:195:3: warning: Assignment of funct=
ion parameter has no effect outside the function. Did you forget dereferenc=
ing it? [uselessAssignmentPtrArg]
     buffer +=3D convert_endian(sizeof(u32), buffer);
     ^

vim +135 drivers/media/dvb-frontends/mxl692.c

b53f2fa136b1b20 Brad Love 2021-01-26  119  =

b53f2fa136b1b20 Brad Love 2021-01-26  120  static void mxl692_tx_swap(enum =
MXL_EAGLE_OPCODE_E opcode, u8 *buffer)
b53f2fa136b1b20 Brad Love 2021-01-26  121  {
b53f2fa136b1b20 Brad Love 2021-01-26  122  #ifdef __BIG_ENDIAN
b53f2fa136b1b20 Brad Love 2021-01-26  123  	return;
b53f2fa136b1b20 Brad Love 2021-01-26  124  #endif
b53f2fa136b1b20 Brad Love 2021-01-26  125  	buffer +=3D MXL_EAGLE_HOST_MSG_=
HEADER_SIZE; /* skip API header */
b53f2fa136b1b20 Brad Love 2021-01-26  126  =

b53f2fa136b1b20 Brad Love 2021-01-26  127  	switch (opcode) {
b53f2fa136b1b20 Brad Love 2021-01-26  128  	case MXL_EAGLE_OPCODE_DEVICE_IN=
TR_MASK_SET:
b53f2fa136b1b20 Brad Love 2021-01-26  129  	case MXL_EAGLE_OPCODE_TUNER_CHA=
NNEL_TUNE_SET:
b53f2fa136b1b20 Brad Love 2021-01-26  130  	case MXL_EAGLE_OPCODE_SMA_TRANS=
MIT_SET:
b53f2fa136b1b20 Brad Love 2021-01-26  131  		buffer +=3D convert_endian(siz=
eof(u32), buffer);
b53f2fa136b1b20 Brad Love 2021-01-26  132  		break;
b53f2fa136b1b20 Brad Love 2021-01-26  133  	case MXL_EAGLE_OPCODE_QAM_PARAM=
S_SET:
b53f2fa136b1b20 Brad Love 2021-01-26  134  		buffer +=3D 5;
b53f2fa136b1b20 Brad Love 2021-01-26 @135  		buffer +=3D convert_endian(2 *=
 sizeof(u32), buffer);
b53f2fa136b1b20 Brad Love 2021-01-26  136  		break;
b53f2fa136b1b20 Brad Love 2021-01-26  137  	default:
b53f2fa136b1b20 Brad Love 2021-01-26  138  		/* no swapping - all get opcod=
es */
b53f2fa136b1b20 Brad Love 2021-01-26  139  		/* ATSC/OOB no swapping */
b53f2fa136b1b20 Brad Love 2021-01-26  140  		break;
b53f2fa136b1b20 Brad Love 2021-01-26  141  	}
b53f2fa136b1b20 Brad Love 2021-01-26  142  }
b53f2fa136b1b20 Brad Love 2021-01-26  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3016400058184842777==--

