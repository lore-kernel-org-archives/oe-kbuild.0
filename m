Content-Type: multipart/mixed; boundary="===============8144946304608169496=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] usb: chipidea: udc: add software sg list support
Date: Sat, 02 May 2020 17:01:49 +0800
Message-ID: <202005021636.JlI1NJAJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8144946304608169496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200501060223.23715-1-peter.chen@kernel.org>
References: <20200501060223.23715-1-peter.chen@kernel.org>
TO: Peter Chen <peter.chen@kernel.org>
TO: linux-usb(a)vger.kernel.org
TO: linux-imx(a)nxp.com
TO: jun.li(a)nxp.com
TO: Peter Chen <peter.chen@nxp.com>
TO: linux-imx(a)nxp.com
TO: jun.li(a)nxp.com
TO: Peter Chen <peter.chen@nxp.com>
CC: linux-imx(a)nxp.com
CC: jun.li(a)nxp.com

Hi Peter,

I love your patch! Perhaps something to improve:

[auto build test WARNING on peter.chen-usb/ci-for-usb-next]
[also build test WARNING on balbi-usb/next usb/usb-testing v5.7-rc3 next-20=
200501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Peter-Chen/usb-chipidea-ud=
c-add-software-sg-list-support/20200501-144717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git =
ci-for-usb-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/chipidea/udc.c:477:26: sparse: sparse: bad assignment (+=3D)=
 to restricted __le32

# https://github.com/0day-ci/linux/commit/0f541fb00a98fe49b6dddc65929085b85=
396259e
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 0f541fb00a98fe49b6dddc65929085b85396259e
vim +477 drivers/usb/chipidea/udc.c

0f541fb00a98fe Peter Chen 2020-05-01  470  =

0f541fb00a98fe Peter Chen 2020-05-01  471  static void ci_add_buffer_entry(=
struct td_node *node, struct scatterlist *s)
0f541fb00a98fe Peter Chen 2020-05-01  472  {
0f541fb00a98fe Peter Chen 2020-05-01  473  	int empty_td_slot_index =3D (CI=
_MAX_BUF_SIZE - node->td_remaining_size)
0f541fb00a98fe Peter Chen 2020-05-01  474  			/ CI_HDRC_PAGE_SIZE;
0f541fb00a98fe Peter Chen 2020-05-01  475  	int i;
0f541fb00a98fe Peter Chen 2020-05-01  476  =

0f541fb00a98fe Peter Chen 2020-05-01 @477  	node->ptr->token +=3D
0f541fb00a98fe Peter Chen 2020-05-01  478  		cpu_to_le32(sg_dma_len(s) << _=
_ffs(TD_TOTAL_BYTES));
0f541fb00a98fe Peter Chen 2020-05-01  479  =

0f541fb00a98fe Peter Chen 2020-05-01  480  	for (i =3D empty_td_slot_index;=
 i < TD_PAGE_COUNT; i++) {
0f541fb00a98fe Peter Chen 2020-05-01  481  		u32 page =3D (u32) sg_dma_addr=
ess(s) +
0f541fb00a98fe Peter Chen 2020-05-01  482  			(i - empty_td_slot_index) * C=
I_HDRC_PAGE_SIZE;
0f541fb00a98fe Peter Chen 2020-05-01  483  =

0f541fb00a98fe Peter Chen 2020-05-01  484  		page &=3D ~TD_RESERVED_MASK;
0f541fb00a98fe Peter Chen 2020-05-01  485  		node->ptr->page[i] =3D cpu_to_=
le32(page);
0f541fb00a98fe Peter Chen 2020-05-01  486  	}
0f541fb00a98fe Peter Chen 2020-05-01  487  }
0f541fb00a98fe Peter Chen 2020-05-01  488  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8144946304608169496==--

