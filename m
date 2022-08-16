Content-Type: multipart/mixed; boundary="===============2428518380798382340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 150/308] arch/x86/kvm/mmu/mmu.c:7276 __mem_attr_is_mixed() error: uninitialized symbol 'entry'.
Date: Wed, 17 Aug 2022 06:48:29 +0800
Message-ID: <202208170645.o8etfqlG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2428518380798382340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chao Peng <chao.p.peng@linux.intel.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   85c097fdd1667a842a9e75d8f658fc16bd72981a
commit: a3b11dafa9058bdecc235b9c02aaae2d6b39c24d [150/308] KVM: Update lpag=
e info when private/shared memory are mixed
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001-20220815 (https://download.01.org/0day-ci/ar=
chive/20220817/202208170645.o8etfqlG-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kvm/mmu/mmu.c:7276 __mem_attr_is_mixed() error: uninitialized symb=
ol 'entry'.

vim +/entry +7276 arch/x86/kvm/mmu/mmu.c

a3b11dafa9058b Chao Peng 2022-07-20  7264  =

a3b11dafa9058b Chao Peng 2022-07-20  7265  static bool __mem_attr_is_mixed(=
struct kvm *kvm, gfn_t start, gfn_t end)
a3b11dafa9058b Chao Peng 2022-07-20  7266  {
a3b11dafa9058b Chao Peng 2022-07-20  7267  	XA_STATE(xas, &kvm->mem_attr_ar=
ray, start);
a3b11dafa9058b Chao Peng 2022-07-20  7268  	bool mixed =3D false;
a3b11dafa9058b Chao Peng 2022-07-20  7269  	gfn_t gfn =3D start;
a3b11dafa9058b Chao Peng 2022-07-20  7270  	void *s_entry;
a3b11dafa9058b Chao Peng 2022-07-20  7271  	void *entry;
a3b11dafa9058b Chao Peng 2022-07-20  7272  =

a3b11dafa9058b Chao Peng 2022-07-20  7273  	rcu_read_lock();
a3b11dafa9058b Chao Peng 2022-07-20  7274  	s_entry =3D xas_load(&xas);
a3b11dafa9058b Chao Peng 2022-07-20  7275  	while (gfn < end) {
a3b11dafa9058b Chao Peng 2022-07-20 @7276  		if (xas_retry(&xas, entry))
a3b11dafa9058b Chao Peng 2022-07-20  7277  			continue;
a3b11dafa9058b Chao Peng 2022-07-20  7278  =

a3b11dafa9058b Chao Peng 2022-07-20  7279  		KVM_BUG_ON(gfn !=3D xas.xa_ind=
ex, kvm);
a3b11dafa9058b Chao Peng 2022-07-20  7280  =

a3b11dafa9058b Chao Peng 2022-07-20  7281  		entry =3D xas_next(&xas);
a3b11dafa9058b Chao Peng 2022-07-20  7282  		if (entry !=3D s_entry) {
a3b11dafa9058b Chao Peng 2022-07-20  7283  			mixed =3D true;
a3b11dafa9058b Chao Peng 2022-07-20  7284  			break;
a3b11dafa9058b Chao Peng 2022-07-20  7285  		}
a3b11dafa9058b Chao Peng 2022-07-20  7286  		gfn++;
a3b11dafa9058b Chao Peng 2022-07-20  7287  	}
a3b11dafa9058b Chao Peng 2022-07-20  7288  	rcu_read_unlock();
a3b11dafa9058b Chao Peng 2022-07-20  7289  	return mixed;
a3b11dafa9058b Chao Peng 2022-07-20  7290  }
a3b11dafa9058b Chao Peng 2022-07-20  7291  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2428518380798382340==--

