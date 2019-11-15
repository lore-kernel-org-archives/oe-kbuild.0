Content-Type: multipart/mixed; boundary="===============1664337984473723805=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [km13park-linux-1:master 4/7] drivers/iommu/intel-iommu.c:3227 audit_iommu_capabilities() error: potentially dereferencing uninitialized 'first_drhd'.
Date: Fri, 15 Nov 2019 09:27:09 +0300
Message-ID: <20191115062709.GI19079@kadam.lan>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1664337984473723805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Gar...  Screwed up the from header again.  Sorry.  -dan ]

tree:   https://github.com/km13park/linux-1.git master
head:   ab295c14dacea474a043ba57e1764a6ffd11f581
commit: d5ef6f395216c0250e11472921cd7fa31e035d6a [4/7] iommu/vt-d: Set mini=
mum value when IOMMUs have inconsistencies

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/intel-iommu.c:3227 audit_iommu_capabilities() error: potentia=
lly dereferencing uninitialized 'first_drhd'.

Old smatch warnings:
drivers/iommu/intel-iommu.c:823 device_to_iommu() error: we previously assu=
med 'pdev' could be null (see line 799)
drivers/iommu/intel-iommu.c:2337 __domain_mapping() error: we previously as=
sumed 'sg' could be null (see line 2244)

# https://github.com/km13park/linux-1/commit/d5ef6f395216c0250e11472921cd7f=
a31e035d6a
git remote add km13park-linux-1 https://github.com/km13park/linux-1.git
git remote update km13park-linux-1
git checkout d5ef6f395216c0250e11472921cd7fa31e035d6a
vim +/first_drhd +3227 drivers/iommu/intel-iommu.c

4c3351c5c04624 Kyung Min Park 2019-11-04  3219  void __init audit_iommu_cap=
abilities(void)
4c3351c5c04624 Kyung Min Park 2019-11-04  3220  {
4c3351c5c04624 Kyung Min Park 2019-11-04  3221  	struct dmar_drhd_unit *fir=
st_drhd;
                                                                           =
    ^^^^^^^^^^

4c3351c5c04624 Kyung Min Park 2019-11-04  3222  	struct dmar_drhd_unit *drh=
d;
4c3351c5c04624 Kyung Min Park 2019-11-04  3223  	struct intel_iommu *iommu;
4c3351c5c04624 Kyung Min Park 2019-11-04  3224  =

4c3351c5c04624 Kyung Min Park 2019-11-04  3225  	iommus_sane =3D true;
5fb7aa7c9d079d Kyung Min Park 2019-11-04  3226  	iommu_svm_cap_sane =3D tru=
e;
d5ef6f395216c0 Kyung Min Park 2019-11-04 @3227  	min_mamv =3D CAP_MAMV_MASK=
 & first_drhd->iommu->cap;
                                                                           =
        ^^^^^^^^^^^^^^^^^^^^^^
Uninitialized

d5ef6f395216c0 Kyung Min Park 2019-11-04  3228  	min_pss =3D ECAP_PSS_MASK =
& first_drhd->iommu->ecap;
4c3351c5c04624 Kyung Min Park 2019-11-04  3229  =

4c3351c5c04624 Kyung Min Park 2019-11-04  3230  	rcu_read_lock();
4c3351c5c04624 Kyung Min Park 2019-11-04  3231  	first_drhd =3D list_first_=
or_null_rcu(&dmar_drhd_units, typeof(*drhd), list);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4c3351c5c04624 Kyung Min Park 2019-11-04  3232  	for_each_iommu(iommu, drhd=
) {
4c3351c5c04624 Kyung Min Park 2019-11-04  3233  		check_capabilities(first_=
drhd->iommu, iommu);
4c3351c5c04624 Kyung Min Park 2019-11-04  3234  	}
76a803a257fbb7 Kyung Min Park 2019-11-01  3235  	for_each_iommu(iommu, drhd=
) {
76a803a257fbb7 Kyung Min Park 2019-11-01  3236  		if (!pi_support_sane)
76a803a257fbb7 Kyung Min Park 2019-11-01  3237  			iommu->cap =3D ~CAP_PI_M=
ASK & iommu->cap;
76a803a257fbb7 Kyung Min Park 2019-11-01  3238  		if (!eafs_sane)
76a803a257fbb7 Kyung Min Park 2019-11-01  3239  			iommu->ecap =3D ~ECAP_EA=
FS_MASK & iommu->ecap;
76a803a257fbb7 Kyung Min Park 2019-11-01  3240  		if (!smts_sane)
76a803a257fbb7 Kyung Min Park 2019-11-01  3241  			iommu->ecap =3D ~ECAP_SM=
TS_MASK & iommu->ecap;
76a803a257fbb7 Kyung Min Park 2019-11-01  3242  		if (!slads_sane)
76a803a257fbb7 Kyung Min Park 2019-11-01  3243  			iommu->ecap =3D ~ECAP_SL=
ADS_MASK & iommu->ecap;
d5ef6f395216c0 Kyung Min Park 2019-11-04  3244  		iommu->cap =3D min_mamv |=
 (~CAP_MAMV_MASK & iommu->cap);
d5ef6f395216c0 Kyung Min Park 2019-11-04  3245  		iommu->ecap =3D min_pss |=
 (~ECAP_PSS_MASK & iommu->ecap);
76a803a257fbb7 Kyung Min Park 2019-11-01  3246  	}
4c3351c5c04624 Kyung Min Park 2019-11-04  3247  	rcu_read_unlock();
4c3351c5c04624 Kyung Min Park 2019-11-04  3248  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1664337984473723805==--

