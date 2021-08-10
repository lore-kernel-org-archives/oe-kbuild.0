Content-Type: multipart/mixed; boundary="===============1332546142485796348=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: warning: Value stored to 'remain' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 10 Aug 2021 22:24:25 +0800
Message-ID: <202108102219.z7Wtj1AS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1332546142485796348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jing Zhang <jingzhangos@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: David Matlack <dmatlack@google.com>
CC: Ricardo Koller <ricarkol@google.com>
CC: Krish Sadhukhan <krish.sadhukhan@oracle.com>
CC: Fuad Tabba <tabba@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9a73fa375d58fee5262dd16473c8e7522bdf44de
commit: cb082bfab59a224a49ae803fed52cd03e8d6b5e0 KVM: stats: Add fd-based A=
PI to read binary stats data
date:   7 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c001-20210806 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 42b9c2=
a17a0b63cccf3ac197a82f91b28e53e643)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcb082bfab59a224a49ae803fed52cd03e8d6b5e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cb082bfab59a224a49ae803fed52cd03e8d6b5e0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/grant-table.c:1360:2: note: Taking true branch
           if (xen_feature(XENFEAT_auto_translated_physmap)) {
           ^
   drivers/xen/grant-table.c:1364:10: note: Assuming 'nr_gframes' is <=3D f=
ield 'count'
                   BUG_ON(xen_auto_xlat_grant_frames.count < nr_gframes);
                          ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/xen/grant-table.c:1364:3: note: Taking false branch
                   BUG_ON(xen_auto_xlat_grant_frames.count < nr_gframes);
                   ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/xen/grant-table.c:1364:3: note: Loop condition is false.  Exitin=
g loop
                   BUG_ON(xen_auto_xlat_grant_frames.count < nr_gframes);
                   ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/xen/grant-table.c:1374:9: note: Calling 'HYPERVISOR_memory_op'
                           rc =3D HYPERVISOR_memory_op(XENMEM_add_to_physma=
p, &xatp);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:334:9: note: Assigned value is garb=
age or undefined
           return _hypercall2(long, memory_op, cmd, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   arch/x86/include/asm/xen/hypercall.h:382:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall3(int, grant_table_op, cmd, uop, count);
                  ^
   arch/x86/include/asm/xen/hypercall.h:180:2: note: expanded from macro '_=
hypercall3'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   drivers/xen/grant-table.c:1479:19: note: Calling 'gnttab_max_grant_frame=
s'
           max_nr_gframes =3D gnttab_max_grant_frames();
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/grant-table.c:716:25: note: Calling '__max_nr_grant_frames'
           unsigned int xen_max =3D __max_nr_grant_frames();
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/grant-table.c:707:7: note: Calling 'HYPERVISOR_grant_table_o=
p'
           rc =3D HYPERVISOR_grant_table_op(GNTTABOP_query_size, &query, 1);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:382:9: note: Assigned value is garb=
age or undefined
           return _hypercall3(int, grant_table_op, cmd, uop, count);
                  ^
   arch/x86/include/asm/xen/hypercall.h:180:2: note: expanded from macro '_=
hypercall3'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   drivers/xen/grant-table.c:1363:3: warning: Value stored to 'rc' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   rc =3D 0;
                   ^    ~
   drivers/xen/grant-table.c:1363:3: note: Value stored to 'rc' is never re=
ad
                   rc =3D 0;
                   ^    ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   arch/x86/kvm/../../../virt/kvm/eventfd.c:385:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/x86/kvm/../../../virt/kvm/eventfd.c:385:2: note: Value stored to 'r=
et' is never read
           ret =3D 0;
           ^     ~
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
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: warning: Value stor=
ed to 'remain' is never read [clang-analyzer-deadcode.DeadStores]
                   remain -=3D copylen;
                   ^         ~~~~~~~
   arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: note: Value stored =
to 'remain' is never read
                   remain -=3D copylen;
                   ^         ~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/binary_stats.c:141:3: warning: Value stor=
ed to 'dest' is never read [clang-analyzer-deadcode.DeadStores]
                   dest +=3D copylen;
                   ^       ~~~~~~~
   arch/x86/kvm/../../../virt/kvm/binary_stats.c:141:3: note: Value stored =
to 'dest' is never read
                   dest +=3D copylen;
                   ^       ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mfd/vx855.c:89:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(=
vx855_cells),
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/mfd/vx855.c:89:2: note: Value stored to 'ret' is never read
           ret =3D mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(=
vx855_cells),
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   kernel/trace/trace_printk.c:77:5: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   kernel/trace/trace_printk.c:77:5: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/rscreate.c:327:5: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(user_prt->source,
                                   ^~~~~~
   drivers/acpi/acpica/rscreate.c:327:5: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                                   strcpy(user_prt->source,
                                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/misc/eeprom/at24.c:334:2: warning: Value stored to 'client' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           client =3D at24_client->client;
           ^        ~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at24.c:334:2: note: Value stored to 'client' is neve=
r read
           client =3D at24_client->client;
           ^        ~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at24.c:397:2: warning: Value stored to 'client' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           client =3D at24_client->client;
           ^        ~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at24.c:397:2: note: Value stored to 'client' is neve=
r read
           client =3D at24_client->client;
           ^        ~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/misc/eeprom/idt_89hpesx.c:977:3: warning: Value stored to 'csrad=
dr_len' is never read [clang-analyzer-deadcode.DeadStores]
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/idt_89hpesx.c:977:3: note: Value stored to 'csraddr_=
len' is never read
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (2 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/remain +139 arch/x86/kvm/../../../virt/kvm/binary_stats.c

cb082bfab59a224 Jing Zhang 2021-06-18   12  =

cb082bfab59a224 Jing Zhang 2021-06-18   13  /**
cb082bfab59a224 Jing Zhang 2021-06-18   14   * kvm_stats_read() - Common fu=
nction to read from the binary statistics
cb082bfab59a224 Jing Zhang 2021-06-18   15   * file descriptor.
cb082bfab59a224 Jing Zhang 2021-06-18   16   *
cb082bfab59a224 Jing Zhang 2021-06-18   17   * @id: identification string o=
f the stats
cb082bfab59a224 Jing Zhang 2021-06-18   18   * @header: stats header for a =
vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   19   * @desc: start address of an a=
rray of stats descriptors for a vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   20   * @stats: start address of sta=
ts data block for a vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   21   * @size_stats: the size of sta=
ts data block pointed by @stats
cb082bfab59a224 Jing Zhang 2021-06-18   22   * @user_buffer: start address =
of userspace buffer
cb082bfab59a224 Jing Zhang 2021-06-18   23   * @size: requested read size f=
rom userspace
cb082bfab59a224 Jing Zhang 2021-06-18   24   * @offset: the start position =
from which the content will be read for the
cb082bfab59a224 Jing Zhang 2021-06-18   25   *          corresponding vm or=
 vcp file descriptor
cb082bfab59a224 Jing Zhang 2021-06-18   26   *
cb082bfab59a224 Jing Zhang 2021-06-18   27   * The file content of a vm/vcp=
u file descriptor is now defined as below:
cb082bfab59a224 Jing Zhang 2021-06-18   28   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   29   * |   Header    |
cb082bfab59a224 Jing Zhang 2021-06-18   30   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   31   * |  id string  |
cb082bfab59a224 Jing Zhang 2021-06-18   32   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   33   * | Descriptors |
cb082bfab59a224 Jing Zhang 2021-06-18   34   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   35   * | Stats Data  |
cb082bfab59a224 Jing Zhang 2021-06-18   36   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   37   * Although this function allow=
s userspace to read any amount of data (as long
cb082bfab59a224 Jing Zhang 2021-06-18   38   * as in the limit) from any po=
sition, the typical usage would follow below
cb082bfab59a224 Jing Zhang 2021-06-18   39   * steps:
cb082bfab59a224 Jing Zhang 2021-06-18   40   * 1. Read header from offset 0=
. Get the offset of descriptors and stats data
cb082bfab59a224 Jing Zhang 2021-06-18   41   *    and some other necessary =
information. This is a one-time work for the
cb082bfab59a224 Jing Zhang 2021-06-18   42   *    lifecycle of the correspo=
nding vm/vcpu stats fd.
cb082bfab59a224 Jing Zhang 2021-06-18   43   * 2. Read id string from its o=
ffset. This is a one-time work for the lifecycle
cb082bfab59a224 Jing Zhang 2021-06-18   44   *    of the corresponding vm/v=
cpu stats fd.
cb082bfab59a224 Jing Zhang 2021-06-18   45   * 3. Read descriptors from its=
 offset and discover all the stats by parsing
cb082bfab59a224 Jing Zhang 2021-06-18   46   *    descriptors. This is a on=
e-time work for the lifecycle of the
cb082bfab59a224 Jing Zhang 2021-06-18   47   *    corresponding vm/vcpu sta=
ts fd.
cb082bfab59a224 Jing Zhang 2021-06-18   48   * 4. Periodically read stats d=
ata from its offset using pread.
cb082bfab59a224 Jing Zhang 2021-06-18   49   *
cb082bfab59a224 Jing Zhang 2021-06-18   50   * Return: the number of bytes =
that has been successfully read
cb082bfab59a224 Jing Zhang 2021-06-18   51   */
cb082bfab59a224 Jing Zhang 2021-06-18   52  ssize_t kvm_stats_read(char *id=
, const struct kvm_stats_header *header,
cb082bfab59a224 Jing Zhang 2021-06-18   53  		       const struct _kvm_stat=
s_desc *desc,
cb082bfab59a224 Jing Zhang 2021-06-18   54  		       void *stats, size_t si=
ze_stats,
cb082bfab59a224 Jing Zhang 2021-06-18   55  		       char __user *user_buff=
er, size_t size, loff_t *offset)
cb082bfab59a224 Jing Zhang 2021-06-18   56  {
cb082bfab59a224 Jing Zhang 2021-06-18   57  	ssize_t len;
cb082bfab59a224 Jing Zhang 2021-06-18   58  	ssize_t copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   59  	ssize_t remain =3D size;
cb082bfab59a224 Jing Zhang 2021-06-18   60  	size_t size_desc;
cb082bfab59a224 Jing Zhang 2021-06-18   61  	size_t size_header;
cb082bfab59a224 Jing Zhang 2021-06-18   62  	void *src;
cb082bfab59a224 Jing Zhang 2021-06-18   63  	loff_t pos =3D *offset;
cb082bfab59a224 Jing Zhang 2021-06-18   64  	char __user *dest =3D user_buf=
fer;
cb082bfab59a224 Jing Zhang 2021-06-18   65  =

cb082bfab59a224 Jing Zhang 2021-06-18   66  	size_header =3D sizeof(*header=
);
cb082bfab59a224 Jing Zhang 2021-06-18   67  	size_desc =3D header->num_desc=
 * sizeof(*desc);
cb082bfab59a224 Jing Zhang 2021-06-18   68  =

cb082bfab59a224 Jing Zhang 2021-06-18   69  	len =3D KVM_STATS_NAME_SIZE + =
size_header + size_desc + size_stats - pos;
cb082bfab59a224 Jing Zhang 2021-06-18   70  	len =3D min(len, remain);
cb082bfab59a224 Jing Zhang 2021-06-18   71  	if (len <=3D 0)
cb082bfab59a224 Jing Zhang 2021-06-18   72  		return 0;
cb082bfab59a224 Jing Zhang 2021-06-18   73  	remain =3D len;
cb082bfab59a224 Jing Zhang 2021-06-18   74  =

cb082bfab59a224 Jing Zhang 2021-06-18   75  	/*
cb082bfab59a224 Jing Zhang 2021-06-18   76  	 * Copy kvm stats header.
cb082bfab59a224 Jing Zhang 2021-06-18   77  	 * The header is the first blo=
ck of content userspace usually read out.
cb082bfab59a224 Jing Zhang 2021-06-18   78  	 * The pos is 0 and the copyle=
n and remain would be the size of header.
cb082bfab59a224 Jing Zhang 2021-06-18   79  	 * The copy of the header woul=
d be skipped if offset is larger than the
cb082bfab59a224 Jing Zhang 2021-06-18   80  	 * size of header. That usuall=
y happens when userspace reads stats
cb082bfab59a224 Jing Zhang 2021-06-18   81  	 * descriptors and stats data.
cb082bfab59a224 Jing Zhang 2021-06-18   82  	 */
cb082bfab59a224 Jing Zhang 2021-06-18   83  	copylen =3D size_header - pos;
cb082bfab59a224 Jing Zhang 2021-06-18   84  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18   85  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18   86  		src =3D (void *)header + pos;
cb082bfab59a224 Jing Zhang 2021-06-18   87  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18   88  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18   89  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   90  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   91  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   92  	}
cb082bfab59a224 Jing Zhang 2021-06-18   93  =

cb082bfab59a224 Jing Zhang 2021-06-18   94  	/*
cb082bfab59a224 Jing Zhang 2021-06-18   95  	 * Copy kvm stats header id st=
ring.
cb082bfab59a224 Jing Zhang 2021-06-18   96  	 * The id string is unique for=
 every vm/vcpu, which is stored in kvm
cb082bfab59a224 Jing Zhang 2021-06-18   97  	 * and kvm_vcpu structure.
cb082bfab59a224 Jing Zhang 2021-06-18   98  	 * The id string is part of th=
e stat header from the perspective of
cb082bfab59a224 Jing Zhang 2021-06-18   99  	 * userspace, it is usually re=
ad out together with previous constant
cb082bfab59a224 Jing Zhang 2021-06-18  100  	 * header part and could be sk=
ipped for later descriptors and stats
cb082bfab59a224 Jing Zhang 2021-06-18  101  	 * data readings.
cb082bfab59a224 Jing Zhang 2021-06-18  102  	 */
cb082bfab59a224 Jing Zhang 2021-06-18  103  	copylen =3D header->id_offset =
+ KVM_STATS_NAME_SIZE - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  104  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  105  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  106  		src =3D id + pos - header->id=
_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  107  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  108  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18  109  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  110  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  111  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  112  	}
cb082bfab59a224 Jing Zhang 2021-06-18  113  =

cb082bfab59a224 Jing Zhang 2021-06-18  114  	/*
cb082bfab59a224 Jing Zhang 2021-06-18  115  	 * Copy kvm stats descriptors.
cb082bfab59a224 Jing Zhang 2021-06-18  116  	 * The descriptors copy would =
be skipped in the typical case that
cb082bfab59a224 Jing Zhang 2021-06-18  117  	 * userspace periodically read=
 stats data, since the pos would be
cb082bfab59a224 Jing Zhang 2021-06-18  118  	 * greater than the end addres=
s of descriptors
cb082bfab59a224 Jing Zhang 2021-06-18  119  	 * (header->header.desc_offset=
 + size_desc) causing copylen <=3D 0.
cb082bfab59a224 Jing Zhang 2021-06-18  120  	 */
cb082bfab59a224 Jing Zhang 2021-06-18  121  	copylen =3D header->desc_offse=
t + size_desc - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  122  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  123  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  124  		src =3D (void *)desc + pos - =
header->desc_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  125  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  126  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18  127  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  128  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  129  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  130  	}
cb082bfab59a224 Jing Zhang 2021-06-18  131  =

cb082bfab59a224 Jing Zhang 2021-06-18  132  	/* Copy kvm stats values */
cb082bfab59a224 Jing Zhang 2021-06-18  133  	copylen =3D header->data_offse=
t + size_stats - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  134  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  135  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  136  		src =3D stats + pos - header-=
>data_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  137  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  138  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18 @139  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  140  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18 @141  		dest +=3D copylen;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1332546142485796348==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CaaLRP6zymyCGDVs9vp/Azoi+F+8AQA=
--===============1332546142485796348==--

