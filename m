Content-Type: multipart/mixed; boundary="===============0066566953810629303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/5] usb: gadget: add trace event of configfs group operation
Date: Thu, 31 Mar 2022 11:38:21 +0800
Message-ID: <202203311137.r3Nm4dyZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0066566953810629303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1648621087-14948-4-git-send-email-quic_linyyuan@quicinc.com>
References: <1648621087-14948-4-git-send-email-quic_linyyuan@quicinc.com>
TO: Linyu Yuan <quic_linyyuan@quicinc.com>
TO: Felipe Balbi <balbi@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-usb(a)vger.kernel.org
CC: Jack Pham <quic_jackp@quicinc.com>
CC: Linyu Yuan <quic_linyyuan@quicinc.com>

Hi Linyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on next-20220330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadge=
t-configfs-new-trace-events/20220330-141926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20331/202203311137.r3Nm4dyZ-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/gadget/trace.c:26 gadget_configfs_group() warn: returning -1 in=
stead of -ENOMEM is sloppy

vim +26 drivers/usb/gadget/trace.c

2f8f6deceeec1e Linyu Yuan 2022-03-30  13  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  14  #ifdef CONFIG_TRACEPOINTS
2f8f6deceeec1e Linyu Yuan 2022-03-30  15  #define GROUP_LEN	128
2f8f6deceeec1e Linyu Yuan 2022-03-30  16  static int gadget_configfs_group(=
char *group, struct config_item *item)
2f8f6deceeec1e Linyu Yuan 2022-03-30  17  {
2f8f6deceeec1e Linyu Yuan 2022-03-30  18  	struct config_item *parent;
2f8f6deceeec1e Linyu Yuan 2022-03-30  19  	char *tmpgroup;
2f8f6deceeec1e Linyu Yuan 2022-03-30  20  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  21  	if (!item)
2f8f6deceeec1e Linyu Yuan 2022-03-30  22  		return -1;
2f8f6deceeec1e Linyu Yuan 2022-03-30  23  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  24  	tmpgroup =3D kzalloc(GROUP_LEN, =
GFP_KERNEL);
2f8f6deceeec1e Linyu Yuan 2022-03-30  25  	if (!tmpgroup)
2f8f6deceeec1e Linyu Yuan 2022-03-30 @26  		return -1;
2f8f6deceeec1e Linyu Yuan 2022-03-30  27  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  28  	for (parent =3D item->ci_parent;=
 parent;
2f8f6deceeec1e Linyu Yuan 2022-03-30  29  			item =3D parent,parent =3D ite=
m->ci_parent) {
2f8f6deceeec1e Linyu Yuan 2022-03-30  30  		if (item->ci_type =3D=3D &gadge=
ts_type) {
2f8f6deceeec1e Linyu Yuan 2022-03-30  31  			kfree(tmpgroup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  32  			return 0;
2f8f6deceeec1e Linyu Yuan 2022-03-30  33  		}
2f8f6deceeec1e Linyu Yuan 2022-03-30  34  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  35  		if (tmpgroup[0] =3D=3D '\0')
2f8f6deceeec1e Linyu Yuan 2022-03-30  36  			snprintf(group, GROUP_LEN, "%s=
",
2f8f6deceeec1e Linyu Yuan 2022-03-30  37  					config_item_name(item));
2f8f6deceeec1e Linyu Yuan 2022-03-30  38  		else
2f8f6deceeec1e Linyu Yuan 2022-03-30  39  			snprintf(group, GROUP_LEN, "%s=
/%s",
2f8f6deceeec1e Linyu Yuan 2022-03-30  40  					config_item_name(item), tmpg=
roup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  41  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  42  		strcpy(tmpgroup, group);
2f8f6deceeec1e Linyu Yuan 2022-03-30  43  	}
2f8f6deceeec1e Linyu Yuan 2022-03-30  44  =

2f8f6deceeec1e Linyu Yuan 2022-03-30  45  	kfree(tmpgroup);
2f8f6deceeec1e Linyu Yuan 2022-03-30  46  	return -1;
2f8f6deceeec1e Linyu Yuan 2022-03-30  47  }
2f8f6deceeec1e Linyu Yuan 2022-03-30  48  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0066566953810629303==--

