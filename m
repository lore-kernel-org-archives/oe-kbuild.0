Content-Type: multipart/mixed; boundary="===============5829781554504319650=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kvm/gaccess.c:1064 access_guest_with_key() error: uninitialized symbol 'prot'.
Date: Fri, 15 Apr 2022 16:34:01 +0800
Message-ID: <202204151626.pDKgwv97-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5829781554504319650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Janis Schoetterl-Glausch" <scgl@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Janosch Frank <frankja@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: e613d83454d7da1c37d78edb278db9c20afb21a2 KVM: s390: Honor storage k=
eys when accessing guest memory
date:   9 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 weeks ago
config: s390-randconfig-m031-20220414 (https://download.01.org/0day-ci/arch=
ive/20220415/202204151626.pDKgwv97-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/s390/kvm/gaccess.c:1064 access_guest_with_key() error: uninitialized s=
ymbol 'prot'.

Old smatch warnings:
arch/s390/kvm/gaccess.c:935 guest_range_to_gpas() error: uninitialized symb=
ol 'prot'.

vim +/prot +1064 arch/s390/kvm/gaccess.c

e613d83454d7da Janis Schoetterl-Glausch 2022-02-11   996  =

e613d83454d7da Janis Schoetterl-Glausch 2022-02-11   997  int access_guest_=
with_key(struct kvm_vcpu *vcpu, unsigned long ga, u8 ar,
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11   998  			  void *data, =
unsigned long len, enum gacc_mode mode,
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11   999  			  u8 access_ke=
y)
2293897805c2fe Heiko Carstens           2014-01-01  1000  {
2293897805c2fe Heiko Carstens           2014-01-01  1001  	psw_t *psw =3D &=
vcpu->arch.sie_block->gpsw;
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1002  	unsigned long nr=
_pages, idx;
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1003  	unsigned long gp=
a_array[2];
416e7f0c9d613b Janis Schoetterl-Glausch 2021-11-26  1004  	unsigned int fra=
gment_len;
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1005  	unsigned long *g=
pas;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1006  	enum prot_type p=
rot;
8a242234b4bfed Heiko Carstens           2014-01-10  1007  	int need_ipte_lo=
ck;
8a242234b4bfed Heiko Carstens           2014-01-10  1008  	union asce asce;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1009  	bool try_storage=
_prot_override;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1010  	bool try_fetch_p=
rot_override;
2293897805c2fe Heiko Carstens           2014-01-01  1011  	int rc;
2293897805c2fe Heiko Carstens           2014-01-01  1012  =

2293897805c2fe Heiko Carstens           2014-01-01  1013  	if (!len)
2293897805c2fe Heiko Carstens           2014-01-01  1014  		return 0;
6167375b558196 David Hildenbrand        2016-05-31  1015  	ga =3D kvm_s390_=
logical_to_effective(vcpu, ga);
6167375b558196 David Hildenbrand        2016-05-31  1016  	rc =3D get_vcpu_=
asce(vcpu, &asce, ga, ar, mode);
664b4973537068 Alexander Yarygin        2015-03-09  1017  	if (rc)
664b4973537068 Alexander Yarygin        2015-03-09  1018  		return rc;
2293897805c2fe Heiko Carstens           2014-01-01  1019  	nr_pages =3D (((=
ga & ~PAGE_MASK) + len - 1) >> PAGE_SHIFT) + 1;
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1020  	gpas =3D gpa_arr=
ay;
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1021  	if (nr_pages > A=
RRAY_SIZE(gpa_array))
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1022  		gpas =3D vmallo=
c(array_size(nr_pages, sizeof(unsigned long)));
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1023  	if (!gpas)
2293897805c2fe Heiko Carstens           2014-01-01  1024  		return -ENOMEM;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1025  	try_fetch_prot_o=
verride =3D fetch_prot_override_applicable(vcpu, mode, asce);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1026  	try_storage_prot=
_override =3D storage_prot_override_applicable(vcpu);
a752598254016d Heiko Carstens           2017-06-03  1027  	need_ipte_lock =
=3D psw_bits(*psw).dat && !asce.r;
8a242234b4bfed Heiko Carstens           2014-01-10  1028  	if (need_ipte_lo=
ck)
8a242234b4bfed Heiko Carstens           2014-01-10  1029  		ipte_lock(vcpu);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1030  	/*
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1031  	 * Since we do t=
he access further down ultimately via a move instruction
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1032  	 * that does key=
 checking and returns an error in case of a protection
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1033  	 * violation, we=
 don't need to do the check during address translation.
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1034  	 * Skip it by pa=
ssing access key 0, which matches any storage key,
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1035  	 * obviating the=
 need for any further checks. As a result the check is
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1036  	 * handled entir=
ely in hardware on access, we only need to take care to
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1037  	 * forego key pr=
otection checking if fetch protection override applies or
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1038  	 * retry with th=
e special key 9 in case of storage protection override.
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1039  	 */
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1040  	rc =3D guest_ran=
ge_to_gpas(vcpu, ga, ar, gpas, len, asce, mode, 0);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1041  	if (rc)
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1042  		goto out_unlock;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1043  	for (idx =3D 0; =
idx < nr_pages; idx++) {
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1044  		fragment_len =
=3D min(PAGE_SIZE - offset_in_page(gpas[idx]), len);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1045  		if (try_fetch_p=
rot_override && fetch_prot_override_applies(ga, fragment_len)) {
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1046  			rc =3D access_=
guest_page(vcpu->kvm, mode, gpas[idx],
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1047  					       data,=
 fragment_len);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1048  		} else {
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1049  			rc =3D access_=
guest_page_with_key(vcpu->kvm, mode, gpas[idx],
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1050  							data, frag=
ment_len, access_key);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1051  		}
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1052  		if (rc =3D=3D P=
GM_PROTECTION && try_storage_prot_override)
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1053  			rc =3D access_=
guest_page_with_key(vcpu->kvm, mode, gpas[idx],
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1054  							data, frag=
ment_len, PAGE_SPO_ACC);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1055  		if (rc =3D=3D P=
GM_PROTECTION)
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1056  			prot =3D PROT_=
TYPE_KEYC;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1057  		if (rc)
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1058  			break;
416e7f0c9d613b Janis Schoetterl-Glausch 2021-11-26  1059  		len -=3D fragme=
nt_len;
416e7f0c9d613b Janis Schoetterl-Glausch 2021-11-26  1060  		data +=3D fragm=
ent_len;
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1061  		ga =3D kvm_s390=
_logical_to_effective(vcpu, ga + fragment_len);
2293897805c2fe Heiko Carstens           2014-01-01  1062  	}
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1063  	if (rc > 0)
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11 @1064  		rc =3D trans_ex=
c(vcpu, rc, ga, ar, mode, prot);
e613d83454d7da Janis Schoetterl-Glausch 2022-02-11  1065  out_unlock:
8a242234b4bfed Heiko Carstens           2014-01-10  1066  	if (need_ipte_lo=
ck)
8a242234b4bfed Heiko Carstens           2014-01-10  1067  		ipte_unlock(vcp=
u);
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1068  	if (nr_pages > A=
RRAY_SIZE(gpa_array))
7faa543df19bf6 Janis Schoetterl-Glausch 2021-11-26  1069  		vfree(gpas);
2293897805c2fe Heiko Carstens           2014-01-01  1070  	return rc;
2293897805c2fe Heiko Carstens           2014-01-01  1071  }
2293897805c2fe Heiko Carstens           2014-01-01  1072  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5829781554504319650==--

