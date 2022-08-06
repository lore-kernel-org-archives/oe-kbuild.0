Content-Type: multipart/mixed; boundary="===============7484061851761235300=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/target/passthru.c:40:12: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 07 Aug 2022 06:32:27 +0800
Message-ID: <202208070642.1nVhtnVz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7484061851761235300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
vme/target/passthru.c:40:12: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alan Adamson <alan.adamson@oracle.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Keith Busch <kbusch@kernel.org>
CC: Chaitanya Kulkarni <kch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   20cf903a0c407cef19300e5c85a03c82593bde36
commit: 34ad61514c4c3657df21a058f9961c3bb2f84ff2 nvmet: add a clear_ids att=
ribute for passthru targets
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220801 (https://download.01.org/0day-ci/archi=
ve/20220807/202208070642.1nVhtnVz-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D34ad61514c4c3657df21a058f9961c3bb2f84ff2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 34ad61514c4c3657df21a058f9961c3bb2f84ff2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/nvme/target/passthru.c: In function 'nvmet_passthru_override_id_=
descs':
>> drivers/nvme/target/passthru.c:40:12: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      40 |         u8 csi;
         |            ^~~
     'nvmet_passthru_override_id_descs': event 1
       |
       |   40 |         u8 csi;
       |      |            ^~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |

vim +40 drivers/nvme/target/passthru.c

77d651a65569a5 Adam Manzanares 2021-08-26  32  =

34ad61514c4c36 Alan Adamson    2022-06-27  33  static u16 nvmet_passthru_ov=
erride_id_descs(struct nvmet_req *req)
34ad61514c4c36 Alan Adamson    2022-06-27  34  {
34ad61514c4c36 Alan Adamson    2022-06-27  35  	struct nvmet_ctrl *ctrl =3D=
 req->sq->ctrl;
34ad61514c4c36 Alan Adamson    2022-06-27  36  	u16 status =3D NVME_SC_SUCC=
ESS;
34ad61514c4c36 Alan Adamson    2022-06-27  37  	int pos, len;
34ad61514c4c36 Alan Adamson    2022-06-27  38  	bool csi_seen =3D false;
34ad61514c4c36 Alan Adamson    2022-06-27  39  	void *data;
34ad61514c4c36 Alan Adamson    2022-06-27 @40  	u8 csi;
34ad61514c4c36 Alan Adamson    2022-06-27  41  =

34ad61514c4c36 Alan Adamson    2022-06-27  42  	if (!ctrl->subsys->clear_id=
s)
34ad61514c4c36 Alan Adamson    2022-06-27  43  		return status;
34ad61514c4c36 Alan Adamson    2022-06-27  44  =

34ad61514c4c36 Alan Adamson    2022-06-27  45  	data =3D kzalloc(NVME_IDENT=
IFY_DATA_SIZE, GFP_KERNEL);
34ad61514c4c36 Alan Adamson    2022-06-27  46  	if (!data)
34ad61514c4c36 Alan Adamson    2022-06-27  47  		return NVME_SC_INTERNAL;
34ad61514c4c36 Alan Adamson    2022-06-27  48  =

34ad61514c4c36 Alan Adamson    2022-06-27  49  	status =3D nvmet_copy_from_=
sgl(req, 0, data, NVME_IDENTIFY_DATA_SIZE);
34ad61514c4c36 Alan Adamson    2022-06-27  50  	if (status)
34ad61514c4c36 Alan Adamson    2022-06-27  51  		goto out_free;
34ad61514c4c36 Alan Adamson    2022-06-27  52  =

34ad61514c4c36 Alan Adamson    2022-06-27  53  	for (pos =3D 0; pos < NVME_=
IDENTIFY_DATA_SIZE; pos +=3D len) {
34ad61514c4c36 Alan Adamson    2022-06-27  54  		struct nvme_ns_id_desc *cu=
r =3D data + pos;
34ad61514c4c36 Alan Adamson    2022-06-27  55  =

34ad61514c4c36 Alan Adamson    2022-06-27  56  		if (cur->nidl =3D=3D 0)
34ad61514c4c36 Alan Adamson    2022-06-27  57  			break;
34ad61514c4c36 Alan Adamson    2022-06-27  58  		if (cur->nidt =3D=3D NVME_=
NIDT_CSI) {
34ad61514c4c36 Alan Adamson    2022-06-27  59  			memcpy(&csi, cur + 1, NVM=
E_NIDT_CSI_LEN);
34ad61514c4c36 Alan Adamson    2022-06-27  60  			csi_seen =3D true;
34ad61514c4c36 Alan Adamson    2022-06-27  61  			break;
34ad61514c4c36 Alan Adamson    2022-06-27  62  		}
34ad61514c4c36 Alan Adamson    2022-06-27  63  		len =3D sizeof(struct nvme=
_ns_id_desc) + cur->nidl;
34ad61514c4c36 Alan Adamson    2022-06-27  64  	}
34ad61514c4c36 Alan Adamson    2022-06-27  65  =

34ad61514c4c36 Alan Adamson    2022-06-27  66  	memset(data, 0, NVME_IDENTI=
FY_DATA_SIZE);
34ad61514c4c36 Alan Adamson    2022-06-27  67  	if (csi_seen) {
34ad61514c4c36 Alan Adamson    2022-06-27  68  		struct nvme_ns_id_desc *cu=
r =3D data;
34ad61514c4c36 Alan Adamson    2022-06-27  69  =

34ad61514c4c36 Alan Adamson    2022-06-27  70  		cur->nidt =3D NVME_NIDT_CS=
I;
34ad61514c4c36 Alan Adamson    2022-06-27  71  		cur->nidl =3D NVME_NIDT_CS=
I_LEN;
34ad61514c4c36 Alan Adamson    2022-06-27  72  		memcpy(cur + 1, &csi, NVME=
_NIDT_CSI_LEN);
34ad61514c4c36 Alan Adamson    2022-06-27  73  	}
34ad61514c4c36 Alan Adamson    2022-06-27  74  	status =3D nvmet_copy_to_sg=
l(req, 0, data, NVME_IDENTIFY_DATA_SIZE);
34ad61514c4c36 Alan Adamson    2022-06-27  75  out_free:
34ad61514c4c36 Alan Adamson    2022-06-27  76  	kfree(data);
34ad61514c4c36 Alan Adamson    2022-06-27  77  	return status;
34ad61514c4c36 Alan Adamson    2022-06-27  78  }
34ad61514c4c36 Alan Adamson    2022-06-27  79  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7484061851761235300==--

