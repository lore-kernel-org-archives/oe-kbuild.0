Content-Type: multipart/mixed; boundary="===============8948471756354457011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2885/9759] drivers/cxl/core/mbox.c:245 cxl_payload_from_user_allowed() warn: should this be a bitwise op?
Date: Sun, 08 May 2022 05:25:52 +0800
Message-ID: <202205080507.sH2qwQhD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8948471756354457011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alison Schofield <alison.schofield@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 6179045ccc0c6229dc449afc1701dc7fbd40571f [2885/9759] cxl/mbox: Bloc=
k immediate mode in SET_PARTITION_INFO command
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
508/202205080507.sH2qwQhD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/mbox.c:245 cxl_payload_from_user_allowed() warn: should th=
is be a bitwise op?

Old smatch warnings:
drivers/cxl/core/mbox.c:268 cxl_mbox_cmd_ctor() warn: passing zero to 'PTR_=
ERR'
drivers/cxl/core/mbox.c:279 cxl_mbox_cmd_ctor() warn: unsigned 'out_size' i=
s never less than zero.

vim +245 drivers/cxl/core/mbox.c

4faf31b43468c5 Dan Williams     2021-09-08  220  =

6179045ccc0c62 Alison Schofield 2022-03-30  221  /**
6179045ccc0c62 Alison Schofield 2022-03-30  222   * cxl_payload_from_user_a=
llowed() - Check contents of in_payload.
6179045ccc0c62 Alison Schofield 2022-03-30  223   * @opcode: The mailbox co=
mmand opcode.
6179045ccc0c62 Alison Schofield 2022-03-30  224   * @payload_in: Pointer to=
 the input payload passed in from user space.
6179045ccc0c62 Alison Schofield 2022-03-30  225   *
6179045ccc0c62 Alison Schofield 2022-03-30  226   * Return:
6179045ccc0c62 Alison Schofield 2022-03-30  227   *  * true	- payload_in pa=
sses check for @opcode.
6179045ccc0c62 Alison Schofield 2022-03-30  228   *  * false	- payload_in c=
ontains invalid or unsupported values.
6179045ccc0c62 Alison Schofield 2022-03-30  229   *
6179045ccc0c62 Alison Schofield 2022-03-30  230   * The driver may inspect =
payload contents before sending a mailbox
6179045ccc0c62 Alison Schofield 2022-03-30  231   * command from user space=
 to the device. The intent is to reject
6179045ccc0c62 Alison Schofield 2022-03-30  232   * commands with input pay=
loads that are known to be unsafe. This
6179045ccc0c62 Alison Schofield 2022-03-30  233   * check is not intended t=
o replace the users careful selection of
6179045ccc0c62 Alison Schofield 2022-03-30  234   * mailbox command paramet=
ers and makes no guarantee that the user
6179045ccc0c62 Alison Schofield 2022-03-30  235   * command will succeed, n=
or that it is appropriate.
6179045ccc0c62 Alison Schofield 2022-03-30  236   *
6179045ccc0c62 Alison Schofield 2022-03-30  237   * The specific checks are=
 determined by the opcode.
6179045ccc0c62 Alison Schofield 2022-03-30  238   */
6179045ccc0c62 Alison Schofield 2022-03-30  239  static bool cxl_payload_fr=
om_user_allowed(u16 opcode, void *payload_in)
6179045ccc0c62 Alison Schofield 2022-03-30  240  {
6179045ccc0c62 Alison Schofield 2022-03-30  241  	switch (opcode) {
6179045ccc0c62 Alison Schofield 2022-03-30  242  	case CXL_MBOX_OP_SET_PART=
ITION_INFO: {
6179045ccc0c62 Alison Schofield 2022-03-30  243  		struct cxl_mbox_set_part=
ition_info *pi =3D payload_in;
6179045ccc0c62 Alison Schofield 2022-03-30  244  =

6179045ccc0c62 Alison Schofield 2022-03-30 @245  		if (pi->flags && CXL_SET=
_PARTITION_IMMEDIATE_FLAG)
6179045ccc0c62 Alison Schofield 2022-03-30  246  			return false;
6179045ccc0c62 Alison Schofield 2022-03-30  247  		break;
6179045ccc0c62 Alison Schofield 2022-03-30  248  	}
6179045ccc0c62 Alison Schofield 2022-03-30  249  	default:
6179045ccc0c62 Alison Schofield 2022-03-30  250  		break;
6179045ccc0c62 Alison Schofield 2022-03-30  251  	}
6179045ccc0c62 Alison Schofield 2022-03-30  252  	return true;
6179045ccc0c62 Alison Schofield 2022-03-30  253  }
6179045ccc0c62 Alison Schofield 2022-03-30  254  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8948471756354457011==--

