Content-Type: multipart/mixed; boundary="===============4709544573973814664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4729/8462] arch/s390/kvm/gaccess.c:859 guest_range_to_gpas() error: uninitialized symbol 'prot'.
Date: Mon, 20 Dec 2021 21:20:33 +0800
Message-ID: <202112202110.2un18JIB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4709544573973814664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Janis Schoetterl-Glausch" <scgl@linux.ibm.com>
CC: Janosch Frank <frankja@linux.ibm.com>
CC: Claudio Imbrenda <imbrenda@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 7619a23b47888ef0176ea2757bc45ec850559b67 [4729/8462] KVM: s390: gac=
cess: Refactor access address range check
:::::: branch date: 3 days ago
:::::: commit date: 13 days ago
config: s390-randconfig-m031-20211220 (https://download.01.org/0day-ci/arch=
ive/20211220/202112202110.2un18JIB-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/s390/kvm/gaccess.c:859 guest_range_to_gpas() error: uninitialized symb=
ol 'prot'.

vim +/prot +859 arch/s390/kvm/gaccess.c

2293897805c2fe Heiko Carstens           2014-01-01  796  =

7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  797  /**
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  798   * guest_range_to_=
gpas() - Calculate guest physical addresses of page fragments
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  799   * covering a logi=
cal range
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  800   * @vcpu: virtual =
cpu
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  801   * @ga: guest addr=
ess, start of range
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  802   * @ar: access reg=
ister
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  803   * @gpas: output a=
rgument, may be NULL
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  804   * @len: length of=
 range in bytes
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  805   * @asce: address-=
space-control element to use for translation
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  806   * @mode: access m=
ode
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  807   *
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  808   * Translate a log=
ical range to a series of guest absolute addresses,
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  809   * such that the c=
oncatenation of page fragments starting at each gpa make up
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  810   * the whole range.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  811   * The translation=
 is performed as if done by the cpu for the given @asce, @ar,
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  812   * @mode and state=
 of the @vcpu.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  813   * If the translat=
ion causes an exception, its program interruption code is
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  814   * returned and th=
e &struct kvm_s390_pgm_info pgm member of @vcpu is modified
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  815   * such that a sub=
sequent call to kvm_s390_inject_prog_vcpu() will inject
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  816   * a correct excep=
tion into the guest.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  817   * The resulting g=
pas are stored into @gpas, unless it is NULL.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  818   *
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  819   * Note: All fragm=
ents except the first one start at the beginning of a page.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  820   *       When deri=
ving the boundaries of a fragment from a gpa, all but the last
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  821   *       fragment =
end at the end of the page.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  822   *
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  823   * Return:
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  824   * * 0		- success
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  825   * * <0		- transla=
tion could not be performed, for example if  guest
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  826   *		  memory could=
 not be accessed
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  827   * * >0		- an acce=
ss exception occurred. In this case the returned value
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  828   *		  is the progr=
am interruption code and the contents of pgm may
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  829   *		  be used to i=
nject an exception into the guest.
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  830   */
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  831  static int guest_r=
ange_to_gpas(struct kvm_vcpu *vcpu, unsigned long ga, u8 ar,
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  832  			       unsigned=
 long *gpas, unsigned long len,
92c9632119b67f David Hildenbrand        2015-11-16  833  			       const un=
ion asce asce, enum gacc_mode mode)
2293897805c2fe Heiko Carstens           2014-01-01  834  {
2293897805c2fe Heiko Carstens           2014-01-01  835  	psw_t *psw =3D &v=
cpu->arch.sie_block->gpsw;
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  836  	unsigned int offs=
et =3D offset_in_page(ga);
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  837  	unsigned int frag=
ment_len;
cde0dcfb5df1db David Hildenbrand        2016-05-31  838  	int lap_enabled, =
rc =3D 0;
6ae1574c2a24ee Christian Borntraeger    2017-06-07  839  	enum prot_type pr=
ot;
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  840  	unsigned long gpa;
2293897805c2fe Heiko Carstens           2014-01-01  841  =

75a1812230ad7a Alexander Yarygin        2015-01-22  842  	lap_enabled =3D l=
ow_address_protection_enabled(vcpu, asce);
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  843  	while (min(PAGE_S=
IZE - offset, len) > 0) {
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  844  		fragment_len =3D=
 min(PAGE_SIZE - offset, len);
2293897805c2fe Heiko Carstens           2014-01-01  845  		ga =3D kvm_s390_=
logical_to_effective(vcpu, ga);
cde0dcfb5df1db David Hildenbrand        2016-05-31  846  		if (mode =3D=3D =
GACC_STORE && lap_enabled && is_low_address(ga))
cde0dcfb5df1db David Hildenbrand        2016-05-31  847  			return trans_ex=
c(vcpu, PGM_PROTECTION, ga, ar, mode,
cde0dcfb5df1db David Hildenbrand        2016-05-31  848  					 PROT_TYPE_LA=
);
a752598254016d Heiko Carstens           2017-06-03  849  		if (psw_bits(*ps=
w).dat) {
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  850  			rc =3D guest_tr=
anslate(vcpu, ga, &gpa, asce, mode, &prot);
2293897805c2fe Heiko Carstens           2014-01-01  851  			if (rc < 0)
2293897805c2fe Heiko Carstens           2014-01-01  852  				return rc;
2293897805c2fe Heiko Carstens           2014-01-01  853  		} else {
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  854  			gpa =3D kvm_s39=
0_real_to_abs(vcpu, ga);
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  855  			if (kvm_is_erro=
r_gpa(vcpu->kvm, gpa))
cde0dcfb5df1db David Hildenbrand        2016-05-31  856  				rc =3D PGM_ADD=
RESSING;
2293897805c2fe Heiko Carstens           2014-01-01  857  		}
cde0dcfb5df1db David Hildenbrand        2016-05-31  858  		if (rc)
6ae1574c2a24ee Christian Borntraeger    2017-06-07 @859  			return trans_ex=
c(vcpu, rc, ga, ar, mode, prot);
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  860  		if (gpas)
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  861  			*gpas++ =3D gpa;
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  862  		offset =3D 0;
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  863  		ga +=3D fragment=
_len;
7619a23b47888e Janis Schoetterl-Glausch 2021-11-26  864  		len -=3D fragmen=
t_len;
2293897805c2fe Heiko Carstens           2014-01-01  865  	}
2293897805c2fe Heiko Carstens           2014-01-01  866  	return 0;
2293897805c2fe Heiko Carstens           2014-01-01  867  }
2293897805c2fe Heiko Carstens           2014-01-01  868  =


:::::: The code at line 859 was first introduced by commit
:::::: 6ae1574c2a24eec5efa8bac305a8f87c839acc64 KVM: s390: implement instru=
ction execution protection for emulated ifetch

:::::: TO: Christian Borntraeger <borntraeger@de.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4709544573973814664==--

