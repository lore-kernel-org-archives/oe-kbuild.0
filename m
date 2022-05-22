Content-Type: multipart/mixed; boundary="===============6258955347038423930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/core/mbox.c:478:55: warning: Parameter 'uuid' can be declared with const [constParameter]
Date: Sun, 22 May 2022 13:43:33 +0800
Message-ID: <202205221353.bptPEffY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6258955347038423930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 4faf31b43468c58e2c8c91cc5fa26f08a6b733be cxl/mbox: Move mailbox and=
 other non-PCI specific infrastructure to the core
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4faf31b43468c58e2c8c91cc5fa26f08a6b733be
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/nvdimm/namespace_devs.c:913:20: warning: Local variable 'res' sh=
adows outer variable [shadowVariable]
     struct resource *res;
                      ^
   drivers/nvdimm/namespace_devs.c:901:19: note: Shadowed declaration
    struct resource *res =3D &nspm->nsio.res;
                     ^
   drivers/nvdimm/namespace_devs.c:913:20: note: Shadow variable
     struct resource *res;
                      ^
>> drivers/nvdimm/namespace_devs.c:1990:10: warning: Local variable 'uuid' =
shadows outer variable [shadowVariable]
     uuid_t uuid;
            ^
   drivers/nvdimm/namespace_devs.c:1958:9: note: Shadowed declaration
    uuid_t uuid;
           ^
   drivers/nvdimm/namespace_devs.c:1990:10: note: Shadow variable
     uuid_t uuid;
            ^
>> drivers/nvdimm/namespace_devs.c:2030:26: warning: Local variable 'ndd' s=
hadows outer variable [shadowVariable]
     struct nvdimm_drvdata *ndd;
                            ^
   drivers/nvdimm/namespace_devs.c:1948:25: note: Shadowed declaration
    struct nvdimm_drvdata *ndd =3D to_ndd(nd_mapping);
                           ^
   drivers/nvdimm/namespace_devs.c:2030:26: note: Shadow variable
     struct nvdimm_drvdata *ndd;
                            ^
>> drivers/nvdimm/namespace_devs.c:2426:26: warning: Local variable 'e' sha=
dows outer variable [shadowVariable]
      struct list_head *l, *e;
                            ^
   drivers/nvdimm/namespace_devs.c:2333:35: note: Shadowed declaration
    struct nd_label_ent *label_ent, *e;
                                     ^
   drivers/nvdimm/namespace_devs.c:2426:26: note: Shadow variable
      struct list_head *l, *e;
                            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/core/mbox.c:478:55: warning: Parameter 'uuid' can be declare=
d with const [constParameter]
   static int cxl_xfer_log(struct cxl_mem *cxlm, uuid_t *uuid, u32 size, u8=
 *out)
                                                         ^
>> drivers/nvdimm/bus.c:859:35: warning: Parameter 'nvdimm' can be declared=
 with const [constParameter]
   u32 nd_cmd_in_size(struct nvdimm *nvdimm, int cmd,
                                     ^
   drivers/nvdimm/bus.c:886:36: warning: Parameter 'nvdimm' can be declared=
 with const [constParameter]
   u32 nd_cmd_out_size(struct nvdimm *nvdimm, int cmd,
                                      ^
>> drivers/nvdimm/bus.c:1241:12: warning: Uninitialized variables: nvdimm_b=
us.nd_desc, nvdimm_bus.wait, nvdimm_bus.list, nvdimm_bus.id, nvdimm_bus.pro=
be_active, nvdimm_bus.ioctl_active, nvdimm_bus.mapping_list, nvdimm_bus.rec=
onfig_mutex, nvdimm_bus.badrange [uninitvar]
      found =3D nvdimm_bus;
              ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1238:8: note: Assuming condition is false
      if (!dev)
          ^
   drivers/nvdimm/bus.c:1241:12: note: Uninitialized variables: nvdimm_bus.=
nd_desc, nvdimm_bus.wait, nvdimm_bus.list, nvdimm_bus.id, nvdimm_bus.probe_=
active, nvdimm_bus.ioctl_active, nvdimm_bus.mapping_list, nvdimm_bus.reconf=
ig_mutex, nvdimm_bus.badrange
      found =3D nvdimm_bus;
              ^
--
>> drivers/nvdimm/namespace_devs.c:1236:9: warning: Uninitialized variable:=
 nd_label [uninitvar]
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:1232:51: note: Assignment 'nd_label=3Dla=
bel_ent->label', assigned value is <Uninit>
      struct nd_namespace_label *nd_label =3D label_ent->label;
                                                     ^
   drivers/nvdimm/namespace_devs.c:1236:9: note: Uninitialized variable: nd=
_label
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:1853:9: warning: Uninitialized variable:=
 nd_label [uninitvar]
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:1850:51: note: Assignment 'nd_label=3Dla=
bel_ent->label', assigned value is <Uninit>
      struct nd_namespace_label *nd_label =3D label_ent->label;
                                                     ^
   drivers/nvdimm/namespace_devs.c:1853:9: note: Uninitialized variable: nd=
_label
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:1902:9: warning: Uninitialized variable:=
 nd_label [uninitvar]
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:1901:24: note: Assignment 'nd_label=3Dla=
bel_ent->label', assigned value is <Uninit>
      nd_label =3D label_ent->label;
                          ^
   drivers/nvdimm/namespace_devs.c:1902:9: note: Uninitialized variable: nd=
_label
      if (!nd_label)
           ^
   drivers/nvdimm/namespace_devs.c:2344:8: warning: Uninitialized variable:=
 nd_label [uninitvar]
     if (!nd_label)
          ^
   drivers/nvdimm/namespace_devs.c:2340:50: note: Assignment 'nd_label=3Dla=
bel_ent->label', assigned value is <Uninit>
     struct nd_namespace_label *nd_label =3D label_ent->label;
                                                    ^
   drivers/nvdimm/namespace_devs.c:2344:8: note: Uninitialized variable: nd=
_label
     if (!nd_label)
          ^

vim +/uuid +478 drivers/cxl/core/mbox.c

4faf31b43468c5 Dan Williams 2021-09-08  477  =

4faf31b43468c5 Dan Williams 2021-09-08 @478  static int cxl_xfer_log(struct=
 cxl_mem *cxlm, uuid_t *uuid, u32 size, u8 *out)
4faf31b43468c5 Dan Williams 2021-09-08  479  {
4faf31b43468c5 Dan Williams 2021-09-08  480  	u32 remaining =3D size;
4faf31b43468c5 Dan Williams 2021-09-08  481  	u32 offset =3D 0;
4faf31b43468c5 Dan Williams 2021-09-08  482  =

4faf31b43468c5 Dan Williams 2021-09-08  483  	while (remaining) {
4faf31b43468c5 Dan Williams 2021-09-08  484  		u32 xfer_size =3D min_t(u32,=
 remaining, cxlm->payload_size);
4faf31b43468c5 Dan Williams 2021-09-08  485  		struct cxl_mbox_get_log {
4faf31b43468c5 Dan Williams 2021-09-08  486  			uuid_t uuid;
4faf31b43468c5 Dan Williams 2021-09-08  487  			__le32 offset;
4faf31b43468c5 Dan Williams 2021-09-08  488  			__le32 length;
4faf31b43468c5 Dan Williams 2021-09-08  489  		} __packed log =3D {
4faf31b43468c5 Dan Williams 2021-09-08  490  			.uuid =3D *uuid,
4faf31b43468c5 Dan Williams 2021-09-08  491  			.offset =3D cpu_to_le32(off=
set),
4faf31b43468c5 Dan Williams 2021-09-08  492  			.length =3D cpu_to_le32(xfe=
r_size)
4faf31b43468c5 Dan Williams 2021-09-08  493  		};
4faf31b43468c5 Dan Williams 2021-09-08  494  		int rc;
4faf31b43468c5 Dan Williams 2021-09-08  495  =

4faf31b43468c5 Dan Williams 2021-09-08  496  		rc =3D cxl_mem_mbox_send_cmd=
(cxlm, CXL_MBOX_OP_GET_LOG, &log,
4faf31b43468c5 Dan Williams 2021-09-08  497  					   sizeof(log), out, xfer=
_size);
4faf31b43468c5 Dan Williams 2021-09-08  498  		if (rc < 0)
4faf31b43468c5 Dan Williams 2021-09-08  499  			return rc;
4faf31b43468c5 Dan Williams 2021-09-08  500  =

4faf31b43468c5 Dan Williams 2021-09-08  501  		out +=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  502  		remaining -=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  503  		offset +=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  504  	}
4faf31b43468c5 Dan Williams 2021-09-08  505  =

4faf31b43468c5 Dan Williams 2021-09-08  506  	return 0;
4faf31b43468c5 Dan Williams 2021-09-08  507  }
4faf31b43468c5 Dan Williams 2021-09-08  508  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6258955347038423930==--

