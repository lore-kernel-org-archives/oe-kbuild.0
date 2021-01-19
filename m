Content-Type: multipart/mixed; boundary="===============2549365422171898161=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kprobes.c:1896:39: warning: Either the condition 'node' is redundant or there is possible null pointer dereference: node.
Date: Tue, 19 Jan 2021 14:26:53 +0800
Message-ID: <202101191447.WWWN0Czj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2549365422171898161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: d741bf41d7c7db4898bacfcb020353cddc032fd8 kprobes: Remove kretprobe =
hash
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/kprobes.c:1896:39: warning: Either the condition 'node' is redund=
ant or there is possible null pointer dereference: node. [nullPointerRedund=
antCheck]
    current->kretprobe_instances.first =3D node->next;
                                         ^
   kernel/kprobes.c:1874:9: note: Assuming that condition 'node' is not red=
undant
    while (node) {
           ^
   kernel/kprobes.c:1896:39: note: Null pointer dereference
    current->kretprobe_instances.first =3D node->next;
                                         ^
   kernel/kprobes.c:1897:2: warning: Either the condition 'node' is redunda=
nt or there is possible null pointer dereference: node. [nullPointerRedunda=
ntCheck]
    node->next =3D NULL;
    ^
   kernel/kprobes.c:1874:9: note: Assuming that condition 'node' is not red=
undant
    while (node) {
           ^
   kernel/kprobes.c:1897:2: note: Null pointer dereference
    node->next =3D NULL;
    ^

vim +/node +1896 kernel/kprobes.c

66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1862  =

66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1863  unsigned long __kretpro=
be_trampoline_handler(struct pt_regs *regs,
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1864  					     void *trampol=
ine_address,
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1865  					     void *frame_p=
ointer)
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1866  {
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1867  	kprobe_opcode_t *corre=
ct_ret_addr =3D NULL;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1868  	struct kretprobe_insta=
nce *ri =3D NULL;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1869  	struct llist_node *fir=
st, *node;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1870  	struct kretprobe *rp;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1871  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1872  	/* Find all nodes for =
this frame. */
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1873  	first =3D node =3D cur=
rent->kretprobe_instances.first;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1874  	while (node) {
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1875  		ri =3D container_of(n=
ode, struct kretprobe_instance, llist);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1876  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1877  		BUG_ON(ri->fp !=3D fr=
ame_pointer);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1878  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1879  		if (ri->ret_addr !=3D=
 trampoline_address) {
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1880  			correct_ret_addr =3D=
 ri->ret_addr;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1881  			/*
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1882  			 * This is the real =
return address. Any other
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1883  			 * instances associa=
ted with this task are for
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1884  			 * other calls deepe=
r on the call stack
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1885  			 */
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1886  			goto found;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1887  		}
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1888  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1889  		node =3D node->next;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1890  	}
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1891  	pr_err("Oops! Kretprob=
e fails to find correct return address.\n");
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1892  	BUG_ON(1);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1893  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1894  found:
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1895  	/* Unlink all nodes fo=
r this frame. */
d741bf41d7c7db48 Peter Zijlstra   2020-08-29 @1896  	current->kretprobe_ins=
tances.first =3D node->next;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1897  	node->next =3D NULL;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1898  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1899  	/* Run them..  */
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1900  	while (first) {
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1901  		ri =3D container_of(f=
irst, struct kretprobe_instance, llist);
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1902  		first =3D first->next;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1903  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1904  		rp =3D get_kretprobe(=
ri);
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1905  		if (rp && rp->handler=
) {
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1906  			struct kprobe *prev =
=3D kprobe_running();
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1907  =

d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1908  			__this_cpu_write(cur=
rent_kprobe, &rp->kp);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1909  			ri->ret_addr =3D cor=
rect_ret_addr;
d741bf41d7c7db48 Peter Zijlstra   2020-08-29  1910  			rp->handler(ri, regs=
);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1911  			__this_cpu_write(cur=
rent_kprobe, prev);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1912  		}
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1913  =

b338817807538c89 Masami Hiramatsu 2020-08-29  1914  		recycle_rp_inst(ri);
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1915  	}
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1916  =

66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1917  	return (unsigned long)=
correct_ret_addr;
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1918  }
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1919  NOKPROBE_SYMBOL(__kretp=
robe_trampoline_handler)
66ada2ccae4ed4dd Masami Hiramatsu 2020-08-29  1920  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2549365422171898161==--

