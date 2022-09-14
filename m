Content-Type: multipart/mixed; boundary="===============3644986562453290546=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6364/6856] arch/arm64/kernel/elfcore.c:114:0: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
Date: Wed, 14 Sep 2022 08:22:11 +0800
Message-ID: <202209140831.iHGnxtJo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3644986562453290546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/arm6=
4/kernel/elfcore.c:114:0: warning: Found a exit path from function with non=
-void return type that has missing return statement [missingReturn]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Will Deacon <will@kernel.org>
CC: Davidlohr Bueso <dave@stgolabs.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0caac1da994900d12a9be6106edb8e98696712a3
commit: 802dfefc28f7dba90fe5a284032016b89131c748 [6364/6856] arm64: Change =
elfcore for_each_mte_vma() to use VMA iterator
:::::: branch date: 14 hours ago
:::::: commit date: 26 hours ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 802dfefc28f7dba90fe5a284032016b89131c748
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/elfcore.c:114:0: warning: Found a exit path from funct=
ion with non-void return type that has missing return statement [missingRet=
urn]
    return 1;
   ^
   arch/arm64/kernel/elfcore.c:142:0: warning: Found a exit path from funct=
ion with non-void return type that has missing return statement [missingRet=
urn]
    return 1;
   ^

vim +114 arch/arm64/kernel/elfcore.c

6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   91  =

6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   92  int elf_core_write_extra_ph=
drs(struct coredump_params *cprm, loff_t offset)
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   93  {
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   94  	struct vm_area_struct *vma;
802dfefc28f7db Liam R. Howlett 2022-09-06   95  	VMA_ITERATOR(vmi, current-=
>mm, 0);
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   96  =

802dfefc28f7db Liam R. Howlett 2022-09-06   97  	for_each_mte_vma(vmi, vma)=
 {
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   98  		struct elf_phdr phdr;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31   99  =

c35fe2a68f29a0 Catalin Marinas 2022-04-25  100  		phdr.p_type =3D PT_AARCH6=
4_MEMTAG_MTE;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  101  		phdr.p_offset =3D offset;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  102  		phdr.p_vaddr =3D vma->vm_=
start;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  103  		phdr.p_paddr =3D 0;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  104  		phdr.p_filesz =3D mte_vma=
_tag_dump_size(vma);
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  105  		phdr.p_memsz =3D vma->vm_=
end - vma->vm_start;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  106  		offset +=3D phdr.p_filesz;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  107  		phdr.p_flags =3D 0;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  108  		phdr.p_align =3D 0;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  109  =

6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  110  		if (!dump_emit(cprm, &phd=
r, sizeof(phdr)))
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  111  			return 0;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  112  	}
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  113  =

6dd8b1a0b6cb3e Catalin Marinas 2022-01-31 @114  	return 1;
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  115  }
6dd8b1a0b6cb3e Catalin Marinas 2022-01-31  116  =


:::::: The code at line 114 was first introduced by commit
:::::: 6dd8b1a0b6cb3ed93d24110e02e67ff9d006610a arm64: mte: Dump the MTE ta=
gs in the core file

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3644986562453290546==--

