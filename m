Content-Type: multipart/mixed; boundary="===============8499388766690972490=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 11/14] efi/gop: Allow specifying mode number on command line
Date: Fri, 20 Mar 2020 17:36:04 +0300
Message-ID: <20200320143526.GI4650@kadam>
In-Reply-To: <20200319192855.29876-12-nivedita@alum.mit.edu>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8499388766690972490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arvind,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Arvind-Sankar/efi-gop-Refa=
ctoring-mode-setting-feature/20200320-044605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/firmware/efi/libstub/gop.c:113 set_mode() error: uninitialized symb=
ol 'new_mode'.

# https://github.com/0day-ci/linux/commit/af85e496c9f577df9743784171b1cda94=
220dd8f
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout af85e496c9f577df9743784171b1cda94220dd8f
vim +/info +85 drivers/firmware/efi/libstub/gop.c

af85e496c9f577 Arvind Sankar 2020-03-19   97  static void set_mode(efi_grap=
hics_output_protocol_t *gop)
af85e496c9f577 Arvind Sankar 2020-03-19   98  {
af85e496c9f577 Arvind Sankar 2020-03-19   99  	efi_graphics_output_protocol=
_mode_t *mode;
af85e496c9f577 Arvind Sankar 2020-03-19  100  	u32 cur_mode, new_mode;
af85e496c9f577 Arvind Sankar 2020-03-19  101  =

af85e496c9f577 Arvind Sankar 2020-03-19  102  	switch (cmdline.option) {
af85e496c9f577 Arvind Sankar 2020-03-19  103  	case EFI_CMDLINE_NONE:
af85e496c9f577 Arvind Sankar 2020-03-19  104  		return;
af85e496c9f577 Arvind Sankar 2020-03-19  105  	case EFI_CMDLINE_MODE_NUM:
af85e496c9f577 Arvind Sankar 2020-03-19  106  		new_mode =3D choose_mode_mo=
denum(gop);
af85e496c9f577 Arvind Sankar 2020-03-19  107  		break;

No default case?

af85e496c9f577 Arvind Sankar 2020-03-19  108  	}
af85e496c9f577 Arvind Sankar 2020-03-19  109  =

af85e496c9f577 Arvind Sankar 2020-03-19  110  	mode =3D efi_table_attr(gop,=
 mode);
af85e496c9f577 Arvind Sankar 2020-03-19  111  	cur_mode =3D efi_table_attr(=
mode, mode);
af85e496c9f577 Arvind Sankar 2020-03-19  112  =

af85e496c9f577 Arvind Sankar 2020-03-19 @113  	if (new_mode =3D=3D cur_mode)
af85e496c9f577 Arvind Sankar 2020-03-19  114  		return;
af85e496c9f577 Arvind Sankar 2020-03-19  115  =

af85e496c9f577 Arvind Sankar 2020-03-19  116  	if (efi_call_proto(gop, set_=
mode, new_mode) !=3D EFI_SUCCESS)
af85e496c9f577 Arvind Sankar 2020-03-19  117  		efi_printk("Failed to set r=
equested mode\n");
af85e496c9f577 Arvind Sankar 2020-03-19  118  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8499388766690972490==--

