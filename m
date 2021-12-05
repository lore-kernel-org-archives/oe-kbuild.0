Content-Type: multipart/mixed; boundary="===============2180677801252141427=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4998/5128] fs/binfmt_elf.c:1168:5: warning: Value stored to 'load_addr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 05 Dec 2021 16:01:04 +0800
Message-ID: <202112051513.dvHnBSM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2180677801252141427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Akira Kawata <akirakawata1@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: 0c9333606e3021dbef39e238a05aadbd306a25e5 [4998/5128] fs/binfmt_elf:=
 Fix AT_PHDR for unusual ELF files
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211203 (https://download.01.org/0day-ci/ar=
chive/20211205/202112051513.dvHnBSM2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D0c9333606e3021dbef39e238a05aadbd306a25e5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c9333606e3021dbef39e238a05aadbd306a25e5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~
   security/integrity/ima/ima_crypto.c:352:2: note: Taking false branch
           if (rc)
           ^
   security/integrity/ima/ima_crypto.c:357:6: note: 'i_size' is not equal t=
o 0
           if (i_size =3D=3D 0)
               ^~~~~~
   security/integrity/ima/ima_crypto.c:357:2: note: Taking false branch
           if (i_size =3D=3D 0)
           ^
   security/integrity/ima/ima_crypto.c:364:12: note: Calling 'ima_alloc_pag=
es'
           rbuf[0] =3D ima_alloc_pages(i_size, &rbuf_size[0], 1);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:249:6: note: Assuming 'order' is not=
 equal to 0, which participates in a condition later
           if (order)
               ^~~~~
   security/integrity/ima/ima_crypto.c:249:2: note: Taking true branch
           if (order)
           ^
   security/integrity/ima/ima_crypto.c:250:11: note: Assuming '__UNIQUE_ID_=
__x371' is >=3D '__UNIQUE_ID___y372'
                   order =3D min(get_order(max_size), order);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   security/integrity/ima/ima_crypto.c:250:11: note: '?' condition is false
                   order =3D min(get_order(max_size), order);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   security/integrity/ima/ima_crypto.c:252:2: note: Loop condition is true.=
  Entering loop body
           for (; order; order--) {
           ^
   security/integrity/ima/ima_crypto.c:254:7: note: Assuming 'ptr' is non-n=
ull, which participates in a condition later
                   if (ptr) {
                       ^~~
   security/integrity/ima/ima_crypto.c:254:3: note: Taking true branch
                   if (ptr) {
                   ^
   security/integrity/ima/ima_crypto.c:256:4: note: Returning pointer (load=
ed from 'ptr'), which participates in a condition later
                           return ptr;
                           ^~~~~~~~~~
   security/integrity/ima/ima_crypto.c:364:12: note: Returning from 'ima_al=
loc_pages'
           rbuf[0] =3D ima_alloc_pages(i_size, &rbuf_size[0], 1);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:365:2: note: Taking false branch
           if (!rbuf[0]) {
           ^
   security/integrity/ima/ima_crypto.c:371:6: note: Assuming the condition =
is false
           if (i_size > rbuf_size[0]) {
               ^~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:371:2: note: Taking false branch
           if (i_size > rbuf_size[0]) {
           ^
   security/integrity/ima/ima_crypto.c:381:19: note: Assuming 'offset' is >=
=3D 'i_size'
           for (offset =3D 0; offset < i_size; offset +=3D rbuf_len) {
                            ^~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:381:2: note: Loop condition is false=
. Execution continues on line 425
           for (offset =3D 0; offset < i_size; offset +=3D rbuf_len) {
           ^
   security/integrity/ima/ima_crypto.c:428:2: note: 2nd function call argum=
ent is an uninitialized value
           ima_free_pages(rbuf[1], rbuf_size[1]);
           ^                       ~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/binfmt_elf.c:1168:5: warning: Value stored to 'load_addr' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                                   load_addr +=3D load_bias;
                                   ^            ~~~~~~~~~
   fs/binfmt_elf.c:1168:5: note: Value stored to 'load_addr' is never read
                                   load_addr +=3D load_bias;
                                   ^            ~~~~~~~~~
   fs/binfmt_elf.c:1314:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1314:3: note: Value stored to 'error' is never read
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   security/integrity/ima/ima_api.c:108:24: warning: Access to field 'templ=
ate_desc' results in a dereference of a null pointer (loaded from variable =
'entry') [clang-analyzer-core.NullDereference]
           char *template_name =3D entry->template_desc->name;
                                 ^
   security/integrity/ima/ima_api.c:325:6: note: Assuming the condition is =
false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:325:41: note: Left side of '&&' is false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
                                                  ^
   security/integrity/ima/ima_api.c:328:11: note: Calling 'ima_alloc_init_t=
emplate'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:45:6: note: Assuming 'desc' is non-null
           if (desc)
               ^~~~
   security/integrity/ima/ima_api.c:45:2: note: Taking true branch
           if (desc)
           ^
   security/integrity/ima/ima_api.c:52:6: note: Assuming the condition is f=
alse
           if (!*entry)
               ^~~~~~~
   security/integrity/ima/ima_api.c:52:2: note: Taking false branch
           if (!*entry)
           ^
   security/integrity/ima/ima_api.c:55:29: note: Assuming 'ima_tpm_chip' is=
 equal to null
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                                      ^
   security/integrity/ima/ima.h:44:26: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                            ^~~~~~~~~~~~
   security/integrity/ima/ima_api.c:55:20: note: '?' condition is false
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                             ^
   security/integrity/ima/ima.h:44:25: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                           ^
   security/integrity/ima/ima_api.c:57:6: note: Assuming 'digests' is non-n=
ull
           if (!digests) {
               ^~~~~~~~
   security/integrity/ima/ima_api.c:57:2: note: Taking false branch
           if (!digests) {
           ^
   security/integrity/ima/ima_api.c:65:14: note: Assuming 'i' is < field 'n=
um_fields'
           for (i =3D 0; i < template_desc->num_fields; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:65:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < template_desc->num_fields; i++) {
           ^
   security/integrity/ima/ima_api.c:72:7: note: Assuming 'result' is not eq=
ual to 0
                   if (result !=3D 0)
                       ^~~~~~~~~~~
   security/integrity/ima/ima_api.c:72:3: note: Taking true branch
                   if (result !=3D 0)
                   ^
   security/integrity/ima/ima_api.c:73:4: note: Control jumps to line 81
                           goto out;
                           ^
   security/integrity/ima/ima_api.c:82:2: note: Null pointer value stored t=
o 'entry'
           *entry =3D NULL;

vim +/load_addr +1168 fs/binfmt_elf.c

00e19ceec80b03 Dave Martin        2020-03-16   822  =

71613c3b871c5a Al Viro            2012-10-20   823  static int load_elf_bin=
ary(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds     2005-04-16   824  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   825  	struct file *interpret=
er =3D NULL; /* to shut gcc up */
0c9333606e3021 Akira Kawata       2021-12-03   826  	unsigned long load_add=
r, load_bias =3D 0, phdr_addr =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   827  	int load_addr_set =3D =
0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   828  	unsigned long error;
a9d9ef133f443a Paul Burton        2014-09-11   829  	struct elf_phdr *elf_p=
pnt, *elf_phdata, *interp_elf_phdata =3D NULL;
00e19ceec80b03 Dave Martin        2020-03-16   830  	struct elf_phdr *elf_p=
roperty_phdata =3D NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   831  	unsigned long elf_bss,=
 elf_brk;
16e72e9b30986e Denys Vlasenko     2017-02-22   832  	int bss_prot =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   833  	int retval, i;
cc503c1b43e002 Jiri Kosina        2008-01-30   834  	unsigned long elf_entr=
y;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   835  	unsigned long e_entry;
cc503c1b43e002 Jiri Kosina        2008-01-30   836  	unsigned long interp_l=
oad_addr =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   837  	unsigned long start_co=
de, end_code, start_data, end_data;
1a530a6f23f7dc David Daney        2011-03-22   838  	unsigned long reloc_fu=
nc_desc __maybe_unused =3D 0;
8de61e69c2feb1 David Rientjes     2006-12-06   839  	int executable_stack =
=3D EXSTACK_DEFAULT;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   840  	struct elfhdr *elf_ex =
=3D (struct elfhdr *)bprm->buf;
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   841  	struct elfhdr *interp_=
elf_ex =3D NULL;
774c105ed8d791 Paul Burton        2014-09-11   842  	struct arch_elf_state =
arch_state =3D INIT_ARCH_ELF_STATE;
03c6d723eeac2d Alexey Dobriyan    2020-01-30   843  	struct mm_struct *mm;
249b08e4e504d4 Alexey Dobriyan    2019-05-14   844  	struct pt_regs *regs;
^1da177e4c3f41 Linus Torvalds     2005-04-16   845  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   846  	retval =3D -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   847  	/* First of all, some =
simple consistency checks */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   848  	if (memcmp(elf_ex->e_i=
dent, ELFMAG, SELFMAG) !=3D 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   849  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   850  =

a62c5b1b6647ea Alexey Dobriyan    2020-01-30   851  	if (elf_ex->e_type !=
=3D ET_EXEC && elf_ex->e_type !=3D ET_DYN)
^1da177e4c3f41 Linus Torvalds     2005-04-16   852  		goto out;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   853  	if (!elf_check_arch(el=
f_ex))
^1da177e4c3f41 Linus Torvalds     2005-04-16   854  		goto out;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   855  	if (elf_check_fdpic(el=
f_ex))
4755200b6b116d Nicolas Pitre      2017-08-16   856  		goto out;
72c2d531920048 Al Viro            2013-09-22   857  	if (!bprm->file->f_op-=
>mmap)
^1da177e4c3f41 Linus Torvalds     2005-04-16   858  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   859  =

a62c5b1b6647ea Alexey Dobriyan    2020-01-30   860  	elf_phdata =3D load_el=
f_phdrs(elf_ex, bprm->file);
^1da177e4c3f41 Linus Torvalds     2005-04-16   861  	if (!elf_phdata)
^1da177e4c3f41 Linus Torvalds     2005-04-16   862  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   863  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   864  	elf_ppnt =3D elf_phdat=
a;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   865  	for (i =3D 0; i < elf_=
ex->e_phnum; i++, elf_ppnt++) {
cc338010a233c0 Alexey Dobriyan    2019-05-14   866  		char *elf_interpreter;
5cf4a36382588e Alexey Dobriyan    2019-05-14   867  =

00e19ceec80b03 Dave Martin        2020-03-16   868  		if (elf_ppnt->p_type =
=3D=3D PT_GNU_PROPERTY) {
00e19ceec80b03 Dave Martin        2020-03-16   869  			elf_property_phdata =
=3D elf_ppnt;
00e19ceec80b03 Dave Martin        2020-03-16   870  			continue;
00e19ceec80b03 Dave Martin        2020-03-16   871  		}
00e19ceec80b03 Dave Martin        2020-03-16   872  =

be0deb585e4c51 Alexey Dobriyan    2019-05-14   873  		if (elf_ppnt->p_type =
!=3D PT_INTERP)
be0deb585e4c51 Alexey Dobriyan    2019-05-14   874  			continue;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   875  =

be0deb585e4c51 Alexey Dobriyan    2019-05-14   876  		/*
be0deb585e4c51 Alexey Dobriyan    2019-05-14   877  		 * This is the progra=
m interpreter used for shared libraries -
be0deb585e4c51 Alexey Dobriyan    2019-05-14   878  		 * for now assume tha=
t this is an a.out format binary.
^1da177e4c3f41 Linus Torvalds     2005-04-16   879  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16   880  		retval =3D -ENOEXEC;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   881  		if (elf_ppnt->p_files=
z > PATH_MAX || elf_ppnt->p_filesz < 2)
e7b9b550f53e81 Al Viro            2009-03-29   882  			goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   883  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   884  		retval =3D -ENOMEM;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   885  		elf_interpreter =3D k=
malloc(elf_ppnt->p_filesz, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16   886  		if (!elf_interpreter)
e7b9b550f53e81 Al Viro            2009-03-29   887  			goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   888  =

658c0335651185 Alexey Dobriyan    2019-12-04   889  		retval =3D elf_read(b=
prm->file, elf_interpreter, elf_ppnt->p_filesz,
658c0335651185 Alexey Dobriyan    2019-12-04   890  				  elf_ppnt->p_offse=
t);
658c0335651185 Alexey Dobriyan    2019-12-04   891  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   892  			goto out_free_interp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   893  		/* make sure path is =
NULL terminated */
^1da177e4c3f41 Linus Torvalds     2005-04-16   894  		retval =3D -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   895  		if (elf_interpreter[e=
lf_ppnt->p_filesz - 1] !=3D '\0')
^1da177e4c3f41 Linus Torvalds     2005-04-16   896  			goto out_free_interp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   897  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   898  		interpreter =3D open_=
exec(elf_interpreter);
cc338010a233c0 Alexey Dobriyan    2019-05-14   899  		kfree(elf_interpreter=
);
^1da177e4c3f41 Linus Torvalds     2005-04-16   900  		retval =3D PTR_ERR(in=
terpreter);
^1da177e4c3f41 Linus Torvalds     2005-04-16   901  		if (IS_ERR(interprete=
r))
cc338010a233c0 Alexey Dobriyan    2019-05-14   902  			goto out_free_ph;
1fb844961818ce Alexey Dobriyan    2007-01-26   903  =

1fb844961818ce Alexey Dobriyan    2007-01-26   904  		/*
be0deb585e4c51 Alexey Dobriyan    2019-05-14   905  		 * If the binary is n=
ot readable then enforce mm->dumpable =3D 0
be0deb585e4c51 Alexey Dobriyan    2019-05-14   906  		 * regardless of the =
interpreter's permissions.
1fb844961818ce Alexey Dobriyan    2007-01-26   907  		 */
1b5d783c94c328 Al Viro            2011-06-19   908  		would_dump(bprm, inte=
rpreter);
1fb844961818ce Alexey Dobriyan    2007-01-26   909  =

0693ffebcfe5ac Alexey Dobriyan    2020-04-06   910  		interp_elf_ex =3D kma=
lloc(sizeof(*interp_elf_ex), GFP_KERNEL);
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   911  		if (!interp_elf_ex) {
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   912  			retval =3D -ENOMEM;
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   913  			goto out_free_ph;
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   914  		}
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   915  =

b582ef5c53040c Maciej W. Rozycki  2015-10-26   916  		/* Get the exec heade=
rs */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   917  		retval =3D elf_read(i=
nterpreter, interp_elf_ex,
c69bcc932ef356 Alexey Dobriyan    2020-04-06   918  				  sizeof(*interp_el=
f_ex), 0);
658c0335651185 Alexey Dobriyan    2019-12-04   919  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   920  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   921  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   922  		break;
cc338010a233c0 Alexey Dobriyan    2019-05-14   923  =

cc338010a233c0 Alexey Dobriyan    2019-05-14   924  out_free_interp:
cc338010a233c0 Alexey Dobriyan    2019-05-14   925  		kfree(elf_interpreter=
);
cc338010a233c0 Alexey Dobriyan    2019-05-14   926  		goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   927  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   928  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   929  	elf_ppnt =3D elf_phdat=
a;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   930  	for (i =3D 0; i < elf_=
ex->e_phnum; i++, elf_ppnt++)
774c105ed8d791 Paul Burton        2014-09-11   931  		switch (elf_ppnt->p_t=
ype) {
774c105ed8d791 Paul Burton        2014-09-11   932  		case PT_GNU_STACK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   933  			if (elf_ppnt->p_flag=
s & PF_X)
^1da177e4c3f41 Linus Torvalds     2005-04-16   934  				executable_stack =
=3D EXSTACK_ENABLE_X;
^1da177e4c3f41 Linus Torvalds     2005-04-16   935  			else
^1da177e4c3f41 Linus Torvalds     2005-04-16   936  				executable_stack =
=3D EXSTACK_DISABLE_X;
^1da177e4c3f41 Linus Torvalds     2005-04-16   937  			break;
774c105ed8d791 Paul Burton        2014-09-11   938  =

774c105ed8d791 Paul Burton        2014-09-11   939  		case PT_LOPROC ... PT=
_HIPROC:
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   940  			retval =3D arch_elf_=
pt_proc(elf_ex, elf_ppnt,
774c105ed8d791 Paul Burton        2014-09-11   941  						  bprm->file, fal=
se,
774c105ed8d791 Paul Burton        2014-09-11   942  						  &arch_state);
774c105ed8d791 Paul Burton        2014-09-11   943  			if (retval)
774c105ed8d791 Paul Burton        2014-09-11   944  				goto out_free_dentr=
y;
774c105ed8d791 Paul Burton        2014-09-11   945  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   946  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   947  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   948  	/* Some simple consist=
ency checks for the interpreter */
cc338010a233c0 Alexey Dobriyan    2019-05-14   949  	if (interpreter) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   950  		retval =3D -ELIBBAD;
d20894a23708c2 Andi Kleen         2008-02-08   951  		/* Not an ELF interpr=
eter */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   952  		if (memcmp(interp_elf=
_ex->e_ident, ELFMAG, SELFMAG) !=3D 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   953  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   954  		/* Verify the interpr=
eter has a valid arch */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   955  		if (!elf_check_arch(i=
nterp_elf_ex) ||
c69bcc932ef356 Alexey Dobriyan    2020-04-06   956  		    elf_check_fdpic(i=
nterp_elf_ex))
^1da177e4c3f41 Linus Torvalds     2005-04-16   957  			goto out_free_dentry;
a9d9ef133f443a Paul Burton        2014-09-11   958  =

a9d9ef133f443a Paul Burton        2014-09-11   959  		/* Load the interpret=
er program headers */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   960  		interp_elf_phdata =3D=
 load_elf_phdrs(interp_elf_ex,
a9d9ef133f443a Paul Burton        2014-09-11   961  						   interpreter);
a9d9ef133f443a Paul Burton        2014-09-11   962  		if (!interp_elf_phdat=
a)
a9d9ef133f443a Paul Burton        2014-09-11   963  			goto out_free_dentry;
774c105ed8d791 Paul Burton        2014-09-11   964  =

774c105ed8d791 Paul Burton        2014-09-11   965  		/* Pass PT_LOPROC..PT=
_HIPROC headers to arch code */
00e19ceec80b03 Dave Martin        2020-03-16   966  		elf_property_phdata =
=3D NULL;
774c105ed8d791 Paul Burton        2014-09-11   967  		elf_ppnt =3D interp_e=
lf_phdata;
c69bcc932ef356 Alexey Dobriyan    2020-04-06   968  		for (i =3D 0; i < int=
erp_elf_ex->e_phnum; i++, elf_ppnt++)
774c105ed8d791 Paul Burton        2014-09-11   969  			switch (elf_ppnt->p_=
type) {
00e19ceec80b03 Dave Martin        2020-03-16   970  			case PT_GNU_PROPERTY:
00e19ceec80b03 Dave Martin        2020-03-16   971  				elf_property_phdata=
 =3D elf_ppnt;
00e19ceec80b03 Dave Martin        2020-03-16   972  				break;
00e19ceec80b03 Dave Martin        2020-03-16   973  =

774c105ed8d791 Paul Burton        2014-09-11   974  			case PT_LOPROC ... P=
T_HIPROC:
c69bcc932ef356 Alexey Dobriyan    2020-04-06   975  				retval =3D arch_elf=
_pt_proc(interp_elf_ex,
774c105ed8d791 Paul Burton        2014-09-11   976  							  elf_ppnt, inte=
rpreter,
774c105ed8d791 Paul Burton        2014-09-11   977  							  true, &arch_st=
ate);
774c105ed8d791 Paul Burton        2014-09-11   978  				if (retval)
774c105ed8d791 Paul Burton        2014-09-11   979  					goto out_free_dent=
ry;
774c105ed8d791 Paul Burton        2014-09-11   980  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   981  			}
774c105ed8d791 Paul Burton        2014-09-11   982  	}
774c105ed8d791 Paul Burton        2014-09-11   983  =

00e19ceec80b03 Dave Martin        2020-03-16   984  	retval =3D parse_elf_p=
roperties(interpreter ?: bprm->file,
00e19ceec80b03 Dave Martin        2020-03-16   985  				      elf_property_=
phdata, &arch_state);
00e19ceec80b03 Dave Martin        2020-03-16   986  	if (retval)
00e19ceec80b03 Dave Martin        2020-03-16   987  		goto out_free_dentry;
00e19ceec80b03 Dave Martin        2020-03-16   988  =

774c105ed8d791 Paul Burton        2014-09-11   989  	/*
774c105ed8d791 Paul Burton        2014-09-11   990  	 * Allow arch code to =
reject the ELF at this point, whilst it's
774c105ed8d791 Paul Burton        2014-09-11   991  	 * still possible to r=
eturn an error to the code that invoked
774c105ed8d791 Paul Burton        2014-09-11   992  	 * the exec syscall.
774c105ed8d791 Paul Burton        2014-09-11   993  	 */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   994  	retval =3D arch_check_=
elf(elf_ex,
c69bcc932ef356 Alexey Dobriyan    2020-04-06   995  				!!interpreter, inte=
rp_elf_ex,
eb4bc076ff94b8 Maciej W. Rozycki  2015-11-13   996  				&arch_state);
774c105ed8d791 Paul Burton        2014-09-11   997  	if (retval)
774c105ed8d791 Paul Burton        2014-09-11   998  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   999  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1000  	/* Flush all traces of=
 the currently running executable */
2388777a0a5957 Eric W. Biederman  2020-05-03  1001  	retval =3D begin_new_e=
xec(bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1002  	if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1003  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1004  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1005  	/* Do this immediately=
, since STACK_TOP as used in setup_arg_pages
^1da177e4c3f41 Linus Torvalds     2005-04-16  1006  	   may depend on the p=
ersonality.  */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1007  	SET_PERSONALITY2(*elf_=
ex, &arch_state);
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1008  	if (elf_read_implies_e=
xec(*elf_ex, executable_stack))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1009  		current->personality =
|=3D READ_IMPLIES_EXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1010  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1011  	if (!(current->persona=
lity & ADDR_NO_RANDOMIZE) && randomize_va_space)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1012  		current->flags |=3D P=
F_RANDOMIZE;
221af7f87b9743 Linus Torvalds     2010-01-28  1013  =

221af7f87b9743 Linus Torvalds     2010-01-28  1014  	setup_new_exec(bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1015  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1016  	/* Do this so that we =
can load the interpreter, if need be.  We will
^1da177e4c3f41 Linus Torvalds     2005-04-16  1017  	   change some of thes=
e later */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1018  	retval =3D setup_arg_p=
ages(bprm, randomize_stack_top(STACK_TOP),
^1da177e4c3f41 Linus Torvalds     2005-04-16  1019  				 executable_stack);
19d860a140beac Al Viro            2014-05-04  1020  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1021  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1022  	=

852643165aea09 Alexey Dobriyan    2019-05-14  1023  	elf_bss =3D 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1024  	elf_brk =3D 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1025  =

852643165aea09 Alexey Dobriyan    2019-05-14  1026  	start_code =3D ~0UL;
852643165aea09 Alexey Dobriyan    2019-05-14  1027  	end_code =3D 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1028  	start_data =3D 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1029  	end_data =3D 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1030  =

af901ca181d92a Andr=C3=A9 Goddard Rosa 2009-11-14  1031  	/* Now we do a li=
ttle grungy work by mmapping the ELF image into
cc503c1b43e002 Jiri Kosina        2008-01-30  1032  	   the correct locatio=
n in memory. */
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1033  	for(i =3D 0, elf_ppnt =
=3D elf_phdata;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1034  	    i < elf_ex->e_phnu=
m; i++, elf_ppnt++) {
b212921b13bda0 Linus Torvalds     2019-10-06  1035  		int elf_prot, elf_fla=
gs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1036  		unsigned long k, vadd=
r;
a87938b2e246b8 Michael Davidson   2015-04-14  1037  		unsigned long total_s=
ize =3D 0;
ce81bb256a2242 Chris Kennelly     2020-10-15  1038  		unsigned long alignme=
nt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1039  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1040  		if (elf_ppnt->p_type =
!=3D PT_LOAD)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1041  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1042  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1043  		if (unlikely (elf_brk=
 > elf_bss)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1044  			unsigned long nbyte;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1045  	            =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1046  			/* There was a PT_LO=
AD segment with p_memsz > p_filesz
^1da177e4c3f41 Linus Torvalds     2005-04-16  1047  			   before this one. =
Map anonymous pages, if needed,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  			   and clear the are=
a.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1049  			retval =3D set_brk(e=
lf_bss + load_bias,
16e72e9b30986e Denys Vlasenko     2017-02-22  1050  					 elf_brk + load_bi=
as,
16e72e9b30986e Denys Vlasenko     2017-02-22  1051  					 bss_prot);
19d860a140beac Al Viro            2014-05-04  1052  			if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1053  				goto out_free_dentr=
y;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1054  			nbyte =3D ELF_PAGEOF=
FSET(elf_bss);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1055  			if (nbyte) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1056  				nbyte =3D ELF_MIN_A=
LIGN - nbyte;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1057  				if (nbyte > elf_brk=
 - elf_bss)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1058  					nbyte =3D elf_brk =
- elf_bss;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1059  				if (clear_user((voi=
d __user *)elf_bss +
^1da177e4c3f41 Linus Torvalds     2005-04-16  1060  							load_bias, nbyte=
)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1061  					/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1062  					 * This bss-zeroin=
g can fail if the ELF
^1da177e4c3f41 Linus Torvalds     2005-04-16  1063  					 * file specifies =
odd protections. So
^1da177e4c3f41 Linus Torvalds     2005-04-16  1064  					 * we don't check =
the return value
^1da177e4c3f41 Linus Torvalds     2005-04-16  1065  					 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1066  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1067  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1068  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1069  =

fe0f67660ee9c9 Dave Martin        2020-03-16  1070  		elf_prot =3D make_pro=
t(elf_ppnt->p_flags, &arch_state,
fe0f67660ee9c9 Dave Martin        2020-03-16  1071  				     !!interpreter,=
 false);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1072  =

4589ff7ca81516 David Hildenbrand  2021-04-23  1073  		elf_flags =3D MAP_PRI=
VATE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1074  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1075  		vaddr =3D elf_ppnt->p=
_vaddr;
eab09532d40090 Kees Cook          2017-07-10  1076  		/*
5f501d555653f8 Kees Cook          2021-11-08  1077  		 * The first time thr=
ough the loop, load_addr_set is false:
5f501d555653f8 Kees Cook          2021-11-08  1078  		 * layout will be cal=
culated. Once set, use MAP_FIXED since
5f501d555653f8 Kees Cook          2021-11-08  1079  		 * we know we've alre=
ady safely mapped the entire region with
5f501d555653f8 Kees Cook          2021-11-08  1080  		 * MAP_FIXED_NOREPLAC=
E in the once-per-binary logic following.
eab09532d40090 Kees Cook          2017-07-10  1081  		 */
5f501d555653f8 Kees Cook          2021-11-08  1082  		if (load_addr_set) {
b212921b13bda0 Linus Torvalds     2019-10-06  1083  			elf_flags |=3D MAP_F=
IXED;
5f501d555653f8 Kees Cook          2021-11-08  1084  		} else if (elf_ex->e_=
type =3D=3D ET_EXEC) {
5f501d555653f8 Kees Cook          2021-11-08  1085  			/*
5f501d555653f8 Kees Cook          2021-11-08  1086  			 * This logic is run=
 once for the first LOAD Program
5f501d555653f8 Kees Cook          2021-11-08  1087  			 * Header for ET_EXE=
C binaries. No special handling
5f501d555653f8 Kees Cook          2021-11-08  1088  			 * is needed.
5f501d555653f8 Kees Cook          2021-11-08  1089  			 */
5f501d555653f8 Kees Cook          2021-11-08  1090  			elf_flags |=3D MAP_F=
IXED_NOREPLACE;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1091  		} else if (elf_ex->e_=
type =3D=3D ET_DYN) {
eab09532d40090 Kees Cook          2017-07-10  1092  			/*
eab09532d40090 Kees Cook          2017-07-10  1093  			 * This logic is run=
 once for the first LOAD Program
eab09532d40090 Kees Cook          2017-07-10  1094  			 * Header for ET_DYN=
 binaries to calculate the
eab09532d40090 Kees Cook          2017-07-10  1095  			 * randomization (lo=
ad_bias) for all the LOAD
5f501d555653f8 Kees Cook          2021-11-08  1096  			 * Program Headers.
eab09532d40090 Kees Cook          2017-07-10  1097  			 *
eab09532d40090 Kees Cook          2017-07-10  1098  			 * There are effecti=
vely two types of ET_DYN
eab09532d40090 Kees Cook          2017-07-10  1099  			 * binaries: program=
s (i.e. PIE: ET_DYN with INTERP)
eab09532d40090 Kees Cook          2017-07-10  1100  			 * and loaders (ET_D=
YN without INTERP, since they
eab09532d40090 Kees Cook          2017-07-10  1101  			 * _are_ the ELF int=
erpreter). The loaders must
eab09532d40090 Kees Cook          2017-07-10  1102  			 * be loaded away fr=
om programs since the program
eab09532d40090 Kees Cook          2017-07-10  1103  			 * may otherwise col=
lide with the loader (especially
eab09532d40090 Kees Cook          2017-07-10  1104  			 * for ET_EXEC which=
 does not have a randomized
eab09532d40090 Kees Cook          2017-07-10  1105  			 * position). For ex=
ample to handle invocations of
eab09532d40090 Kees Cook          2017-07-10  1106  			 * "./ld.so someprog=
" to test out a new version of
eab09532d40090 Kees Cook          2017-07-10  1107  			 * the loader, the s=
ubsequent program that the
eab09532d40090 Kees Cook          2017-07-10  1108  			 * loader loads must=
 avoid the loader itself, so
eab09532d40090 Kees Cook          2017-07-10  1109  			 * they cannot share=
 the same load range. Sufficient
eab09532d40090 Kees Cook          2017-07-10  1110  			 * room for the brk =
must be allocated with the
eab09532d40090 Kees Cook          2017-07-10  1111  			 * loader as well, s=
ince brk must be available with
eab09532d40090 Kees Cook          2017-07-10  1112  			 * the loader.
eab09532d40090 Kees Cook          2017-07-10  1113  			 *
eab09532d40090 Kees Cook          2017-07-10  1114  			 * Therefore, progra=
ms are loaded offset from
eab09532d40090 Kees Cook          2017-07-10  1115  			 * ELF_ET_DYN_BASE a=
nd loaders are loaded into the
eab09532d40090 Kees Cook          2017-07-10  1116  			 * independently ran=
domized mmap region (0 load_bias
5f501d555653f8 Kees Cook          2021-11-08  1117  			 * without MAP_FIXED=
 nor MAP_FIXED_NOREPLACE).
eab09532d40090 Kees Cook          2017-07-10  1118  			 */
cc338010a233c0 Alexey Dobriyan    2019-05-14  1119  			if (interpreter) {
eab09532d40090 Kees Cook          2017-07-10  1120  				load_bias =3D ELF_E=
T_DYN_BASE;
a3defbe5c337db Jiri Kosina        2011-11-02  1121  				if (current->flags =
& PF_RANDOMIZE)
d1fd836dcf00d2 Kees Cook          2015-04-14  1122  					load_bias +=3D arc=
h_mmap_rnd();
ce81bb256a2242 Chris Kennelly     2020-10-15  1123  				alignment =3D maxim=
um_alignment(elf_phdata, elf_ex->e_phnum);
ce81bb256a2242 Chris Kennelly     2020-10-15  1124  				if (alignment)
ce81bb256a2242 Chris Kennelly     2020-10-15  1125  					load_bias &=3D ~(a=
lignment - 1);
5f501d555653f8 Kees Cook          2021-11-08  1126  				elf_flags |=3D MAP_=
FIXED_NOREPLACE;
eab09532d40090 Kees Cook          2017-07-10  1127  			} else
eab09532d40090 Kees Cook          2017-07-10  1128  				load_bias =3D 0;
eab09532d40090 Kees Cook          2017-07-10  1129  =

eab09532d40090 Kees Cook          2017-07-10  1130  			/*
eab09532d40090 Kees Cook          2017-07-10  1131  			 * Since load_bias i=
s used for all subsequent loading
eab09532d40090 Kees Cook          2017-07-10  1132  			 * calculations, we =
must lower it by the first vaddr
eab09532d40090 Kees Cook          2017-07-10  1133  			 * so that the remai=
ning calculations based on the
eab09532d40090 Kees Cook          2017-07-10  1134  			 * ELF vaddrs will b=
e correctly offset. The result
eab09532d40090 Kees Cook          2017-07-10  1135  			 * is then page alig=
ned.
eab09532d40090 Kees Cook          2017-07-10  1136  			 */
eab09532d40090 Kees Cook          2017-07-10  1137  			load_bias =3D ELF_PA=
GESTART(load_bias - vaddr);
5f501d555653f8 Kees Cook          2021-11-08  1138  		}
eab09532d40090 Kees Cook          2017-07-10  1139  =

5f501d555653f8 Kees Cook          2021-11-08  1140  		/*
5f501d555653f8 Kees Cook          2021-11-08  1141  		 * Calculate the enti=
re size of the ELF mapping (total_size).
5f501d555653f8 Kees Cook          2021-11-08  1142  		 * (Note that load_ad=
dr_set is set to true later once the
5f501d555653f8 Kees Cook          2021-11-08  1143  		 * initial mapping is=
 performed.)
5f501d555653f8 Kees Cook          2021-11-08  1144  		 */
5f501d555653f8 Kees Cook          2021-11-08  1145  		if (!load_addr_set) {
a87938b2e246b8 Michael Davidson   2015-04-14  1146  			total_size =3D total=
_mapping_size(elf_phdata,
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1147  							elf_ex->e_phnum);
a87938b2e246b8 Michael Davidson   2015-04-14  1148  			if (!total_size) {
2b1d3ae940acd1 Andrew Morton      2015-05-28  1149  				retval =3D -EINVAL;
a87938b2e246b8 Michael Davidson   2015-04-14  1150  				goto out_free_dentr=
y;
a87938b2e246b8 Michael Davidson   2015-04-14  1151  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1152  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1153  =

f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1154  		error =3D elf_map(bpr=
m->file, load_bias + vaddr, elf_ppnt,
a87938b2e246b8 Michael Davidson   2015-04-14  1155  				elf_prot, elf_flags=
, total_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1156  		if (BAD_ADDR(error)) {
b140f25108a8b1 Alexey Kuznetsov   2007-05-08  1157  			retval =3D IS_ERR((v=
oid *)error) ?
b140f25108a8b1 Alexey Kuznetsov   2007-05-08  1158  				PTR_ERR((void*)erro=
r) : -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1159  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1160  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1161  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1162  		if (!load_addr_set) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1163  			load_addr_set =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1164  			load_addr =3D (elf_p=
pnt->p_vaddr - elf_ppnt->p_offset);
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1165  			if (elf_ex->e_type =
=3D=3D ET_DYN) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1166  				load_bias +=3D erro=
r -
^1da177e4c3f41 Linus Torvalds     2005-04-16  1167  				             ELF_PA=
GESTART(load_bias + vaddr);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1168  				load_addr +=3D load=
_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1169  				reloc_func_desc =3D=
 load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1170  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1171  		}
0c9333606e3021 Akira Kawata       2021-12-03  1172  =

0c9333606e3021 Akira Kawata       2021-12-03  1173  		if (elf_ppnt->p_offse=
t <=3D elf_ex->e_phoff &&
0c9333606e3021 Akira Kawata       2021-12-03  1174  		    elf_ex->e_phoff <=
 elf_ppnt->p_offset + elf_ppnt->p_filesz) {
0c9333606e3021 Akira Kawata       2021-12-03  1175  			phdr_addr =3D elf_ex=
->e_phoff - elf_ppnt->p_offset +
0c9333606e3021 Akira Kawata       2021-12-03  1176  				    elf_ppnt->p_vad=
dr;
0c9333606e3021 Akira Kawata       2021-12-03  1177  		}
0c9333606e3021 Akira Kawata       2021-12-03  1178  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1179  		k =3D elf_ppnt->p_vad=
dr;
f67ef446291a09 Alexey Dobriyan    2020-01-30  1180  		if ((elf_ppnt->p_flag=
s & PF_X) && k < start_code)
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1181  			start_code =3D k;
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1182  		if (start_data < k)
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1183  			start_data =3D k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1184  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1185  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1186  		 * Check to see if th=
e section's size will overflow the
^1da177e4c3f41 Linus Torvalds     2005-04-16  1187  		 * allowed task size.=
 Note that p_filesz must always be
^1da177e4c3f41 Linus Torvalds     2005-04-16  1188  		 * <=3D p_memsz so it=
 is only necessary to check p_memsz.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1189  		 */
ce51059be56f63 Chuck Ebbert       2006-07-03  1190  		if (BAD_ADDR(k) || el=
f_ppnt->p_filesz > elf_ppnt->p_memsz ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1191  		    elf_ppnt->p_memsz=
 > TASK_SIZE ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1192  		    TASK_SIZE - elf_p=
pnt->p_memsz < k) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1193  			/* set_brk can never=
 work. Avoid overflows. */
b140f25108a8b1 Alexey Kuznetsov   2007-05-08  1194  			retval =3D -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1195  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1196  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1197  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1198  		k =3D elf_ppnt->p_vad=
dr + elf_ppnt->p_filesz;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1199  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1200  		if (k > elf_bss)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1201  			elf_bss =3D k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1202  		if ((elf_ppnt->p_flag=
s & PF_X) && end_code < k)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1203  			end_code =3D k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1204  		if (end_data < k)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1205  			end_data =3D k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1206  		k =3D elf_ppnt->p_vad=
dr + elf_ppnt->p_memsz;
16e72e9b30986e Denys Vlasenko     2017-02-22  1207  		if (k > elf_brk) {
16e72e9b30986e Denys Vlasenko     2017-02-22  1208  			bss_prot =3D elf_pro=
t;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1209  			elf_brk =3D k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1210  		}
16e72e9b30986e Denys Vlasenko     2017-02-22  1211  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1212  =

a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1213  	e_entry =3D elf_ex->e_=
entry + load_bias;
0c9333606e3021 Akira Kawata       2021-12-03  1214  	phdr_addr +=3D load_bi=
as;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1215  	elf_bss +=3D load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1216  	elf_brk +=3D load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1217  	start_code +=3D load_b=
ias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1218  	end_code +=3D load_bia=
s;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1219  	start_data +=3D load_b=
ias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1220  	end_data +=3D load_bia=
s;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1221  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1222  	/* Calling set_brk eff=
ectively mmaps the pages that we need
^1da177e4c3f41 Linus Torvalds     2005-04-16  1223  	 * for the bss and bre=
ak sections.  We must do this before
^1da177e4c3f41 Linus Torvalds     2005-04-16  1224  	 * mapping in the inte=
rpreter, to make sure it doesn't wind
^1da177e4c3f41 Linus Torvalds     2005-04-16  1225  	 * up getting placed w=
here the bss needs to go.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1226  	 */
16e72e9b30986e Denys Vlasenko     2017-02-22  1227  	retval =3D set_brk(elf=
_bss, elf_brk, bss_prot);
19d860a140beac Al Viro            2014-05-04  1228  	if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1229  		goto out_free_dentry;
6de505173e24e7 akpm(a)osdl.org      2005-10-11  1230  	if (likely(elf_bss !=
=3D elf_brk) && unlikely(padzero(elf_bss))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1231  		retval =3D -EFAULT; /=
* Nobody gets to see this, but.. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1232  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1233  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1234  =

cc338010a233c0 Alexey Dobriyan    2019-05-14  1235  	if (interpreter) {
c69bcc932ef356 Alexey Dobriyan    2020-04-06  1236  		elf_entry =3D load_el=
f_interp(interp_elf_ex,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1237  					    interpreter,
fe0f67660ee9c9 Dave Martin        2020-03-16  1238  					    load_bias, int=
erp_elf_phdata,
fe0f67660ee9c9 Dave Martin        2020-03-16  1239  					    &arch_state);
cc503c1b43e002 Jiri Kosina        2008-01-30  1240  		if (!IS_ERR((void *)e=
lf_entry)) {
cc503c1b43e002 Jiri Kosina        2008-01-30  1241  			/*
cc503c1b43e002 Jiri Kosina        2008-01-30  1242  			 * load_elf_interp()=
 returns relocation
cc503c1b43e002 Jiri Kosina        2008-01-30  1243  			 * adjustment
cc503c1b43e002 Jiri Kosina        2008-01-30  1244  			 */
cc503c1b43e002 Jiri Kosina        2008-01-30  1245  			interp_load_addr =3D=
 elf_entry;
c69bcc932ef356 Alexey Dobriyan    2020-04-06  1246  			elf_entry +=3D inter=
p_elf_ex->e_entry;
cc503c1b43e002 Jiri Kosina        2008-01-30  1247  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1248  		if (BAD_ADDR(elf_entr=
y)) {
ce51059be56f63 Chuck Ebbert       2006-07-03  1249  			retval =3D IS_ERR((v=
oid *)elf_entry) ?
ce51059be56f63 Chuck Ebbert       2006-07-03  1250  					(int)elf_entry : -=
EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1251  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1252  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1253  		reloc_func_desc =3D i=
nterp_load_addr;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1254  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1255  		allow_write_access(in=
terpreter);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1256  		fput(interpreter);
0693ffebcfe5ac Alexey Dobriyan    2020-04-06  1257  =

0693ffebcfe5ac Alexey Dobriyan    2020-04-06  1258  		kfree(interp_elf_ex);
aa0d1564b10f91 Alexey Dobriyan    2020-04-06  1259  		kfree(interp_elf_phda=
ta);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1260  	} else {
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1261  		elf_entry =3D e_entry;
5342fba5412cea Suresh Siddha      2006-02-26  1262  		if (BAD_ADDR(elf_entr=
y)) {
ce51059be56f63 Chuck Ebbert       2006-07-03  1263  			retval =3D -EINVAL;
5342fba5412cea Suresh Siddha      2006-02-26  1264  			goto out_free_dentry;
5342fba5412cea Suresh Siddha      2006-02-26  1265  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1266  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1267  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1268  	kfree(elf_phdata);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1269  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1270  	set_binfmt(&elf_format=
);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1271  =


:::::: The code at line 1168 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2180677801252141427==--

