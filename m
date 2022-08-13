Content-Type: multipart/mixed; boundary="===============6287472830344465750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 3/5] cpumask: fix invalid uniprocessor mask assumption
Date: Sat, 13 Aug 2022 23:10:27 +0800
Message-ID: <202208132214.IbhtWzlp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6287472830344465750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/trace/ring_buffer.c:1826:3: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <e78c55ecb98172356248a7a89da501479ead6ae0.1659077534.git.sande=
r@svanheule.net>
References: <e78c55ecb98172356248a7a89da501479ead6ae0.1659077534.git.sander=
@svanheule.net>
TO: Sander Vanheule <sander@svanheule.net>
TO: linux-kernel(a)vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Brendan Higgins <brendanhiggins@google.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: David Gow <davidgow@google.com>
CC: Borislav Petkov <bp@alien8.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "H . Peter Anvin" <hpa@zytor.com>
CC: Ingo Molnar <mingo@redhat.com>
CC: "Ma=C3=ADra Canal" <mairacanal@riseup.net>
CC: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Valentin Schneider <vschneid@redhat.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Sander Vanheule <sander@svanheule.net>

Hi Sander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on v5.19]
[cannot apply to akpm-mm/mm-everything tip/master linus/master bp/for-next =
next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/cpum=
ask-fix-invalid-uniprocessor-assumptions/20220729-150359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git a1a5482=
a2c6e38a3ebed32e571625c56a8cc41a6
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-c004-20220808 (https://download.01.org/0day-ci/arch=
ive/20220813/202208132214.IbhtWzlp-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7b65d53bebb7b5378fd=
a6fd2fa4202d2a4c3a5c9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sander-Vanheule/cpumask-fix-invali=
d-uniprocessor-assumptions/20220729-150359
        git checkout 7b65d53bebb7b5378fda6fd2fa4202d2a4c3a5c9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   mm/compaction.c:693:6: note: Assuming 'block_start_pfn' is >=3D field 'z=
one_start_pfn'
           if (block_start_pfn < cc->zone->zone_start_pfn)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:693:2: note: Taking false branch
           if (block_start_pfn < cc->zone->zone_start_pfn)
           ^
   mm/compaction.c:697:9: note: Assuming 'pfn' is >=3D 'end_pfn'
           for (; pfn < end_pfn; pfn +=3D isolated,
                  ^~~~~~~~~~~~~
   mm/compaction.c:697:2: note: Loop condition is false. Execution continue=
s on line 739
           for (; pfn < end_pfn; pfn +=3D isolated,
           ^
   mm/compaction.c:739:2: note: Calling 'split_map_pages'
           split_map_pages(&freelist);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:93:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, list, lru) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 39 warnings (37 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   kernel/trace/trace_event_perf.c:416:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&raw_data[size - sizeof(u64)], 0, sizeof(u64));
           ^~~~~~
   kernel/trace/trace_event_perf.c:416:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&raw_data[size - sizeof(u64)], 0, sizeof(u64));
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   kernel/utsname_sysctl.c:39:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&uts_table, table, sizeof(uts_table));
           ^~~~~~
   kernel/utsname_sysctl.c:39:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&uts_table, table, sizeof(uts_table));
           ^~~~~~
   kernel/utsname_sysctl.c:49:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
           ^~~~~~
   kernel/utsname_sysctl.c:49:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
           ^~~~~~
   kernel/utsname_sysctl.c:61:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
                   ^~~~~~
   kernel/utsname_sysctl.c:61:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
                   ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> kernel/trace/ring_buffer.c:1826:3: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
                   rb_free_cpu_buffer(buffer->buffers[cpu]);
                   ^                  ~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1825:2: note: Assuming 'cpu' is < 1
           for_each_buffer_cpu(buffer, cpu)
           ^
   kernel/trace/ring_buffer.c:289:2: note: expanded from macro 'for_each_bu=
ffer_cpu'
           for_each_cpu(cpu, buffer->cpumask)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:218:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1825:2: note: Loop condition is true.  Enteri=
ng loop body
           for_each_buffer_cpu(buffer, cpu)
           ^
   kernel/trace/ring_buffer.c:289:2: note: expanded from macro 'for_each_bu=
ffer_cpu'
           for_each_cpu(cpu, buffer->cpumask)
           ^
   include/linux/cpumask.h:216:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   kernel/trace/ring_buffer.c:1826:3: note: Calling 'rb_free_cpu_buffer'
                   rb_free_cpu_buffer(buffer->buffers[cpu]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1723:6: note: Assuming 'head' is null
           if (head) {
               ^~~~
   kernel/trace/ring_buffer.c:1723:2: note: Taking false branch
           if (head) {
           ^
   kernel/trace/ring_buffer.c:1732:2: note: Memory is released
           kfree(cpu_buffer);
           ^~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1826:3: note: Returning; memory was released =
via 1st parameter
                   rb_free_cpu_buffer(buffer->buffers[cpu]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1825:2: note: Assuming 'cpu' is < 1
           for_each_buffer_cpu(buffer, cpu)
           ^
   kernel/trace/ring_buffer.c:289:2: note: expanded from macro 'for_each_bu=
ffer_cpu'
           for_each_cpu(cpu, buffer->cpumask)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:218:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:1825:2: note: Loop condition is true.  Enteri=
ng loop body
           for_each_buffer_cpu(buffer, cpu)
           ^
   kernel/trace/ring_buffer.c:289:2: note: expanded from macro 'for_each_bu=
ffer_cpu'
           for_each_cpu(cpu, buffer->cpumask)
           ^
   include/linux/cpumask.h:216:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   kernel/trace/ring_buffer.c:1826:3: note: Use of memory after it is freed
                   rb_free_cpu_buffer(buffer->buffers[cpu]);
                   ^                  ~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:2262:3: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
                   list_for_each_entry_safe(bpage, tmp, &cpu_buffer->new_pa=
ges,
                   ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   kernel/trace/ring_buffer.c:2094:6: note: Assuming 'buffer' is non-null
           if (!buffer)
               ^~~~~~~
   kernel/trace/ring_buffer.c:2094:2: note: Taking false branch
           if (!buffer)
           ^
   kernel/trace/ring_buffer.c:2098:6: note: Assuming the condition is false
           if (cpu_id !=3D RING_BUFFER_ALL_CPUS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:2098:37: note: Left side of '&&' is false
           if (cpu_id !=3D RING_BUFFER_ALL_CPUS &&
                                              ^
   kernel/trace/ring_buffer.c:2105:6: note: Assuming 'nr_pages' is >=3D 2
           if (nr_pages < 2)
               ^~~~~~~~~~~~
   kernel/trace/ring_buffer.c:2105:2: note: Taking false branch
           if (nr_pages < 2)
           ^
   kernel/trace/ring_buffer.c:2112:2: note: Taking true branch
           if (cpu_id =3D=3D RING_BUFFER_ALL_CPUS) {
           ^
   kernel/trace/ring_buffer.c:2118:3: note: Assuming 'cpu' is >=3D 1
                   for_each_buffer_cpu(buffer, cpu) {
                   ^
   kernel/trace/ring_buffer.c:289:2: note: expanded from macro 'for_each_bu=
ffer_cpu'
           for_each_cpu(cpu, buffer->cpumask)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:218:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)

vim +1826 kernel/trace/ring_buffer.c

7a8e76a3829f10 Steven Rostedt            2008-09-29  1813  =

7a8e76a3829f10 Steven Rostedt            2008-09-29  1814  /**
7a8e76a3829f10 Steven Rostedt            2008-09-29  1815   * ring_buffer_f=
ree - free a ring buffer.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1816   * @buffer: the =
buffer to free.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1817   */
7a8e76a3829f10 Steven Rostedt            2008-09-29  1818  void
13292494379f92 Steven Rostedt (VMware    2019-12-13  1819) ring_buffer_free=
(struct trace_buffer *buffer)
7a8e76a3829f10 Steven Rostedt            2008-09-29  1820  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  1821  	int cpu;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1822  =

b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1823  	cpuhp_state_rem=
ove_instance(CPUHP_TRACE_RB_PREPARE, &buffer->node);
554f786e284a6c Steven Rostedt            2009-03-11  1824  =

7a8e76a3829f10 Steven Rostedt            2008-09-29  1825  	for_each_buffer=
_cpu(buffer, cpu)
7a8e76a3829f10 Steven Rostedt            2008-09-29 @1826  		rb_free_cpu_bu=
ffer(buffer->buffers[cpu]);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1827  =

bd3f02212d6a45 Eric Dumazet              2009-08-07  1828  	kfree(buffer->b=
uffers);
9e01c1b74c9531 Rusty Russell             2009-01-01  1829  	free_cpumask_va=
r(buffer->cpumask);
9e01c1b74c9531 Rusty Russell             2009-01-01  1830  =

7a8e76a3829f10 Steven Rostedt            2008-09-29  1831  	kfree(buffer);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1832  }
c4f50183f90fb1 Robert Richter            2008-12-11  1833  EXPORT_SYMBOL_GP=
L(ring_buffer_free);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1834  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6287472830344465750==--

