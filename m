Content-Type: multipart/mixed; boundary="===============2071749207135043055=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1] fscrypt: support encrypted and trusted keys
Date: Wed, 28 Jul 2021 00:56:09 +0800
Message-ID: <202107280039.cXWeeaw8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2071749207135043055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210727144349.11215-1-a.fatoum@pengutronix.de>
References: <20210727144349.11215-1-a.fatoum@pengutronix.de>
TO: Ahmad Fatoum <a.fatoum@pengutronix.de>

Hi Ahmad,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.14-rc3 next-20210726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ahmad-Fatoum/fscrypt-suppo=
rt-encrypted-and-trusted-keys/20210727-224735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
349a2d52ffe59b7a0c5876fa7ee9f3eaf188b830
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  122> /*
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  123>  * fscrypt_=
add_key_arg::raw contains the raw key material directly
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  124>  * if key_i=
d =3D=3D 0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  125>  */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  126> #define FSC=
RYPT_KEY_ADD_RAW_ASIS		0
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  127> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  128> /*
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  129>  * fscrypt_=
add_key_arg::raw is a key descriptor for an already
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  130>  * existing=
 kernel encrypted or trusted key if key_id =3D=3D 0.
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  131>  * The kern=
el key's material will be used as input for fscrypt.
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  132>  */
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  133> #define FSC=
RYPT_KEY_ADD_RAW_DESC		1
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  134> =

   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  127< 	__u32 __re=
served[8];
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  140> 	__u32 raw_=
flags;	/* one of FSCRYPT_KEY_ADD_RAW_* */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' diffe=
rs from latest version at 'include/uapi/linux/fscrypt.h':  141> 	__u32 __re=
served[7];

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2071749207135043055==--

