Content-Type: multipart/mixed; boundary="===============0278313823090877863=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.18-rc4-nesting 65/70] drivers/iommu/iommufd/pasid.c:39:25: sparse: sparse: dubious: !x & y
Date: Tue, 14 Jun 2022 10:07:30 +0800
Message-ID: <202206141037.xHsqMzVD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0278313823090877863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommufd/pasid.c:39:25: sparse: sparse: dubious: !x & y"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.18-rc4-nesting
head:   e642747ca46aa568063964b5b5101e35258ea0d5
commit: d31540d648e6d794af2a9e5ff8bfff0e7c1e4575 [65/70] iommufd: Add IOMMU=
_ALLOC_PASID
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220614/202206141037.xHsqMzVD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/luxis1999/iommufd/commit/d31540d648e6d794af2a9=
e5ff8bfff0e7c1e4575
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.18-rc4-nesting
        git checkout d31540d648e6d794af2a9e5ff8bfff0e7c1e4575
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/pasid.c:39:25: sparse: sparse: dubious: !x & y

vim +39 drivers/iommu/iommufd/pasid.c

d31540d648e6d7 Yi Liu 2022-05-25  20  =

d31540d648e6d7 Yi Liu 2022-05-25  21  int iommufd_alloc_pasid(struct iommuf=
d_ucmd *ucmd)
d31540d648e6d7 Yi Liu 2022-05-25  22  {
d31540d648e6d7 Yi Liu 2022-05-25  23  	struct iommu_alloc_pasid *cmd =3D uc=
md->cmd;
d31540d648e6d7 Yi Liu 2022-05-25  24  	struct iommufd_pasid_data *pdata;
d31540d648e6d7 Yi Liu 2022-05-25  25  	int rc;
d31540d648e6d7 Yi Liu 2022-05-25  26  =

d31540d648e6d7 Yi Liu 2022-05-25  27  	if (cmd->flags & ~IOMMU_ALLOC_PASID_=
IDENTICAL)
d31540d648e6d7 Yi Liu 2022-05-25  28  		return -EOPNOTSUPP;
d31540d648e6d7 Yi Liu 2022-05-25  29  =

d31540d648e6d7 Yi Liu 2022-05-25  30  	if (cmd->range.min > cmd->range.max =
||
d31540d648e6d7 Yi Liu 2022-05-25  31  	    cmd->range.min >=3D (1 << IOASID=
_BITS) ||
d31540d648e6d7 Yi Liu 2022-05-25  32  	    cmd->range.max >=3D (1 << IOASID=
_BITS))
d31540d648e6d7 Yi Liu 2022-05-25  33  		return -EINVAL;
d31540d648e6d7 Yi Liu 2022-05-25  34  =

d31540d648e6d7 Yi Liu 2022-05-25  35  	pdata =3D kzalloc(sizeof(*pdata), GF=
P_KERNEL);
d31540d648e6d7 Yi Liu 2022-05-25  36  	if (!pdata)
d31540d648e6d7 Yi Liu 2022-05-25  37  		return -ENOMEM;
d31540d648e6d7 Yi Liu 2022-05-25  38  =

d31540d648e6d7 Yi Liu 2022-05-25 @39  	if (!cmd->flags & IOMMU_ALLOC_PASID_=
IDENTICAL)
d31540d648e6d7 Yi Liu 2022-05-25  40  		pdata->vpasid =3D cmd->pasid;
d31540d648e6d7 Yi Liu 2022-05-25  41  	pdata->pasid =3D pdata->vpasid =3D
d31540d648e6d7 Yi Liu 2022-05-25  42  				ioasid_alloc(&ucmd->ictx->pasid_s=
et,
d31540d648e6d7 Yi Liu 2022-05-25  43  				cmd->range.min, cmd->range.max,
d31540d648e6d7 Yi Liu 2022-05-25  44  				pdata);
d31540d648e6d7 Yi Liu 2022-05-25  45  	if (!pasid_valid(pdata->pasid)) {
d31540d648e6d7 Yi Liu 2022-05-25  46  		rc =3D -ENOMEM;
d31540d648e6d7 Yi Liu 2022-05-25  47  		goto out_free_mem;
d31540d648e6d7 Yi Liu 2022-05-25  48  	}
d31540d648e6d7 Yi Liu 2022-05-25  49  =

d31540d648e6d7 Yi Liu 2022-05-25  50  	cmd->pasid =3D pdata->pasid;
d31540d648e6d7 Yi Liu 2022-05-25  51  	rc =3D iommufd_ucmd_respond(ucmd, si=
zeof(*cmd));
d31540d648e6d7 Yi Liu 2022-05-25  52  	if (rc)
d31540d648e6d7 Yi Liu 2022-05-25  53  		goto out_free_pasid;
d31540d648e6d7 Yi Liu 2022-05-25  54  =

d31540d648e6d7 Yi Liu 2022-05-25  55  	return 0;
d31540d648e6d7 Yi Liu 2022-05-25  56  out_free_pasid:
d31540d648e6d7 Yi Liu 2022-05-25  57  	ioasid_free(pdata->pasid);
d31540d648e6d7 Yi Liu 2022-05-25  58  out_free_mem:
d31540d648e6d7 Yi Liu 2022-05-25  59  	kfree(pdata);
d31540d648e6d7 Yi Liu 2022-05-25  60  	return rc;
d31540d648e6d7 Yi Liu 2022-05-25  61  }
d31540d648e6d7 Yi Liu 2022-05-25  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0278313823090877863==--

