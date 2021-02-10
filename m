Content-Type: multipart/mixed; boundary="===============8079545744727306030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ragnatech:media-tree 307/361] drivers/media/dvb-frontends/mxl692.c:135:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Thu, 11 Feb 2021 04:54:52 +0800
Message-ID: <202102110444.wFfpbTeK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8079545744727306030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Brad Love <brad@nextdimension.cc>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sean Young <sean@mess.org>

tree:   git://git.ragnatech.se/linux media-tree
head:   7f03d9fefcc55ed4882338126ef1f6b6778ea21f
commit: b53f2fa136b1b20f03184f4a98fea75eb2705eac [307/361] media: mxl692: M=
axLinear 692 ATSC demod/tuner driver
:::::: branch date: 31 hours ago
:::::: commit date: 5 days ago
compiler: or1k-linux-gcc (GCC) 9.3.0

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

b53f2fa136b1b2 Brad Love 2021-01-26  119  =

b53f2fa136b1b2 Brad Love 2021-01-26  120  static void mxl692_tx_swap(enum M=
XL_EAGLE_OPCODE_E opcode, u8 *buffer)
b53f2fa136b1b2 Brad Love 2021-01-26  121  {
b53f2fa136b1b2 Brad Love 2021-01-26  122  #ifdef __BIG_ENDIAN
b53f2fa136b1b2 Brad Love 2021-01-26  123  	return;
b53f2fa136b1b2 Brad Love 2021-01-26  124  #endif
b53f2fa136b1b2 Brad Love 2021-01-26  125  	buffer +=3D MXL_EAGLE_HOST_MSG_H=
EADER_SIZE; /* skip API header */
b53f2fa136b1b2 Brad Love 2021-01-26  126  =

b53f2fa136b1b2 Brad Love 2021-01-26  127  	switch (opcode) {
b53f2fa136b1b2 Brad Love 2021-01-26  128  	case MXL_EAGLE_OPCODE_DEVICE_INT=
R_MASK_SET:
b53f2fa136b1b2 Brad Love 2021-01-26  129  	case MXL_EAGLE_OPCODE_TUNER_CHAN=
NEL_TUNE_SET:
b53f2fa136b1b2 Brad Love 2021-01-26  130  	case MXL_EAGLE_OPCODE_SMA_TRANSM=
IT_SET:
b53f2fa136b1b2 Brad Love 2021-01-26  131  		buffer +=3D convert_endian(size=
of(u32), buffer);
b53f2fa136b1b2 Brad Love 2021-01-26  132  		break;
b53f2fa136b1b2 Brad Love 2021-01-26  133  	case MXL_EAGLE_OPCODE_QAM_PARAMS=
_SET:
b53f2fa136b1b2 Brad Love 2021-01-26  134  		buffer +=3D 5;
b53f2fa136b1b2 Brad Love 2021-01-26 @135  		buffer +=3D convert_endian(2 * =
sizeof(u32), buffer);
b53f2fa136b1b2 Brad Love 2021-01-26  136  		break;
b53f2fa136b1b2 Brad Love 2021-01-26  137  	default:
b53f2fa136b1b2 Brad Love 2021-01-26  138  		/* no swapping - all get opcode=
s */
b53f2fa136b1b2 Brad Love 2021-01-26  139  		/* ATSC/OOB no swapping */
b53f2fa136b1b2 Brad Love 2021-01-26  140  		break;
b53f2fa136b1b2 Brad Love 2021-01-26  141  	}
b53f2fa136b1b2 Brad Love 2021-01-26  142  }
b53f2fa136b1b2 Brad Love 2021-01-26  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8079545744727306030==--

