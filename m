Content-Type: multipart/mixed; boundary="===============4817067996421213864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jakob-koschel:lkp-patches-2022-03-29 5/90] arch/arm/mm/ioremap.c:105:15: warning: Uninitialized variables: iter.vm, iter.list [uninitvar]
Date: Mon, 04 Apr 2022 20:43:31 +0800
Message-ID: <202204042010.UVSseLAE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4817067996421213864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jakob Koschel <jakobkoschel@gmail.com>

tree:   https://github.com/Jakob-Koschel/linux.git lkp-patches-2022-03-29
head:   1f940dfb827918b188198ef88d2cd89f07ef81bf
commit: b0aa0f989cee460f75c7d1101bef8afe9ee4b220 [5/90] ARM: ioremap: remov=
e usage of list iterator for list_add() after the loop body
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   arch/arm/mm/ioremap.c:72:46: warning: Parameter 'vaddr' can be declared =
with const [constParameter]
   struct static_vm *find_static_vm_vaddr(void *vaddr)
                                                ^
   arch/arm/mm/ioremap.c:85:11: warning: Uninitialized variables: svm.vm, s=
vm.list [uninitvar]
      return svm;
             ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:85:11: note: Uninitialized variables: svm.vm, svm.=
list
      return svm;
             ^
>> arch/arm/mm/ioremap.c:105:15: warning: Uninitialized variables: iter.vm,=
 iter.list [uninitvar]
      curr_svm =3D iter;
                 ^
--
>> block/blk-crypto-fallback.c:176:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If bio_for_each_segment is a macro=
 then please configure it. [unknownMacro]
    bio_for_each_segment(bv, bio_src, iter)
    ^

vim +105 arch/arm/mm/ioremap.c

ed8fd2186a4e4f Joonsoo Kim   2013-02-09   90  =

ed8fd2186a4e4f Joonsoo Kim   2013-02-09   91  void __init add_static_vm_ear=
ly(struct static_vm *svm)
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   92  {
b0aa0f989cee46 Jakob Koschel 2022-03-02   93  	struct static_vm *curr_svm =
=3D NULL, *iter;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   94  	struct vm_struct *vm;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   95  	void *vaddr;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   96  =

ed8fd2186a4e4f Joonsoo Kim   2013-02-09   97  	vm =3D &svm->vm;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   98  	vm_area_add_early(vm);
ed8fd2186a4e4f Joonsoo Kim   2013-02-09   99  	vaddr =3D vm->addr;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  100  =

b0aa0f989cee46 Jakob Koschel 2022-03-02  101  	list_for_each_entry(iter, &s=
tatic_vmlist, list) {
b0aa0f989cee46 Jakob Koschel 2022-03-02  102  		vm =3D &iter->vm;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  103  =

b0aa0f989cee46 Jakob Koschel 2022-03-02  104  		if (vm->addr > vaddr) {
b0aa0f989cee46 Jakob Koschel 2022-03-02 @105  			curr_svm =3D iter;
b0aa0f989cee46 Jakob Koschel 2022-03-02  106  			list_add_tail(&svm->list, =
&iter->list);
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  107  			break;
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  108  		}
b0aa0f989cee46 Jakob Koschel 2022-03-02  109  	}
b0aa0f989cee46 Jakob Koschel 2022-03-02  110  	if (!curr_svm)
b0aa0f989cee46 Jakob Koschel 2022-03-02  111  		list_add_tail(&svm->list, &=
static_vmlist);
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  112  }
ed8fd2186a4e4f Joonsoo Kim   2013-02-09  113  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4817067996421213864==--

