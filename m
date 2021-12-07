Content-Type: multipart/mixed; boundary="===============7689296480559514257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_edif.c:27:12: warning: union member 'Anonymous151::async' is never used. [unusedStructMember]
Date: Tue, 07 Dec 2021 09:01:35 +0800
Message-ID: <202112070806.WWBw08R2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7689296480559514257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Quinn Tran <qutran@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Larry Wisneski <Larry.Wisneski@marvell.com>
CC: Duane Grigsby <duane.grigsby@marvell.com>
CC: Rick Hicksted Jr <rhicksted@marvell.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f80ef9e49fdfbfbc4197711230098b90e6b05a7e
commit: 7a09e8d92c6d56121910ccb2e8bc0d1affff66ee scsi: qla2xxx: edif: Add d=
oorbell notification for app
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/dwc3/gadget.c:2217:33: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
    } while (--timeout && !(!is_on ^ !reg));
                                   ^
>> drivers/scsi/qla2xxx/qla_edif.c:27:12: warning: union member 'Anonymous1=
51::async' is never used. [unusedStructMember]
     uint32_t async;
              ^

vim +27 drivers/scsi/qla2xxx/qla_edif.c

84318a9f01ce13 Quinn Tran 2021-06-23  21  =

7a09e8d92c6d56 Quinn Tran 2021-06-23  22  struct edb_node {
7a09e8d92c6d56 Quinn Tran 2021-06-23  23  	struct  list_head	list;
7a09e8d92c6d56 Quinn Tran 2021-06-23  24  	uint32_t		ntype;
7a09e8d92c6d56 Quinn Tran 2021-06-23  25  	union {
7a09e8d92c6d56 Quinn Tran 2021-06-23  26  		port_id_t	plogi_did;
7a09e8d92c6d56 Quinn Tran 2021-06-23 @27  		uint32_t	async;
7a09e8d92c6d56 Quinn Tran 2021-06-23  28  		port_id_t	els_sid;
7a09e8d92c6d56 Quinn Tran 2021-06-23  29  		struct edif_sa_update_aen	sa_ae=
n;
7a09e8d92c6d56 Quinn Tran 2021-06-23  30  	} u;
7a09e8d92c6d56 Quinn Tran 2021-06-23  31  };
7a09e8d92c6d56 Quinn Tran 2021-06-23  32  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7689296480559514257==--

