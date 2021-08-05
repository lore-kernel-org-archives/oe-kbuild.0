Content-Type: multipart/mixed; boundary="===============0949136090174626177=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_hwlat.c:479:2: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 05 Aug 2021 16:37:33 +0800
Message-ID: <202108051624.KCBSPfgI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0949136090174626177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   251a1524293d0a90c4d5060f65f42a3016280049
commit: f46b16520a087e892a189db9c23ccf7e9bb5fa69 trace/hwlat: Implement the=
 per-cpu mode
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
compiler: mips64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> kernel/trace/trace_hwlat.c:479:2: warning: %d in format string (no. 1) r=
equires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgTyp=
e_sint]
    snprintf(comm, 24, "hwlatd/%d", cpu);
    ^

vim +479 kernel/trace/trace_hwlat.c

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  470  =

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  471  /*
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  472   * start_cpu_kth=
read - Start a hwlat cpu kthread
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  473   */
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  474  static int start=
_cpu_kthread(unsigned int cpu)
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  475  {
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  476  	struct task_str=
uct *kthread;
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  477  	char comm[24];
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  478  =

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22 @479  	snprintf(comm, =
24, "hwlatd/%d", cpu);
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  480  =

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  481  	kthread =3D kth=
read_create_on_cpu(kthread_fn, NULL, cpu, comm);
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  482  	if (IS_ERR(kthr=
ead)) {
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  483  		pr_err(BANNER =
"could not start sampling thread\n");
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  484  		return -ENOMEM;
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  485  	}
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  486  =

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  487  	per_cpu(hwlat_p=
er_cpu_data, cpu).kthread =3D kthread;
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  488  	wake_up_process=
(kthread);
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  489  =

f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  490  	return 0;
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  491  }
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  492  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0949136090174626177==--

