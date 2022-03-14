Content-Type: multipart/mixed; boundary="===============8468293710048512671=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [toke:xdp-queueing-03 7/9] net/core/filter.c:9794:0: warning: Invalid number of character '(' when no macros are defined. [syntaxError]
Date: Mon, 14 Mar 2022 12:12:15 +0800
Message-ID: <202203141234.HSgcZuUe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8468293710048512671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-=
queueing-03
head:   fc2f0f778f386a279e545a0fd75649f84b53a870
commit: bcfe29d7ce34000d68e17c027cda99aab5d96e44 [7/9] bpf: Enable direct p=
acket access for dequeue packets
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
no macros are defined. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_CGROUPS'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_CGROUP_NET_CLASSID'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_NET_CLS_ACT'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_NET_RX_BUSY_POLL'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_NET_SCHED'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_SOCK_CGROUP_DATA'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_SOCK_RX_QUEUE_MAPPING'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'CONFIG_XFRM'. [syntaxError]
   =

   ^
>> net/core/filter.c:9794:0: warning: Invalid number of character '(' when =
these macros are defined: 'NET_SKBUFF_DATA_USES_OFFSET'. [syntaxError]
   =

   ^

vim +9794 net/core/filter.c

bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9757  =

bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9758  static u32
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9759  dequeue_convert_xd=
p_md_access(enum bpf_access_type type,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9760  			      const str=
uct bpf_insn *si, struct bpf_insn *insn_buf,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9761  			      struct bp=
f_prog *prog, u32 *target_size)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9762  {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9763  	struct bpf_insn *=
insn =3D insn_buf;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9764  	int src_reg;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9765  =

bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9766  	switch (si->off) {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9767  	case offsetof(str=
uct xdp_md, data):
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9768  		/* dst_reg =3D *=
(src_reg + off(xdp_frame, data)) */
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9769  		*insn++ =3D BPF_=
LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_frame, data),
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9770  				      si->dst_=
reg, si->src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9771  				      offsetof=
(struct xdp_frame, data));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9772  		break;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9773  	case offsetof(str=
uct xdp_md, data_meta):
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9774  		if (si->dst_reg =
=3D=3D si->src_reg) {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9775  			src_reg =3D BPF=
_REG_9;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9776  			if (si->dst_reg=
 =3D=3D src_reg)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9777  				src_reg--;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9778  			*insn++ =3D BPF=
_STX_MEM(BPF_DW, si->src_reg, src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9779  					      offseto=
f(struct xdp_frame, next));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9780  			*insn++ =3D BPF=
_MOV64_REG(src_reg, si->src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9781  		} else {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9782  			src_reg =3D si-=
>src_reg;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9783  		}
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9784  		/* AX =3D src_reg
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9785                  * =
dst_reg =3D *(src_reg + off(xdp_frame, data))
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9786                  * =
src_reg =3D *(src_reg + off(xdp_frame, metasize))
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9787                  * =
dst_reg -=3D src_reg
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9788                  * =
src_reg =3D AX
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9789                  */
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9790  		*insn++ =3D BPF_=
MOV64_REG(BPF_REG_AX, src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9791  		*insn++ =3D BPF_=
LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_frame, data),
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9792  				      si->dst_=
reg, src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9793  				      offsetof=
(struct xdp_frame, data));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14 @9794  		*insn++ =3D BPF_=
LDX_MEM(BPF_B, /* metasize =3D=3D 8 bits */
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9795  				      src_reg,=
 src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9796  		// FIXME: Add BU=
ILD_BUG_ON/make this more generic
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9797  #if defined(__LITT=
LE_ENDIAN_BITFIELD)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9798  				      offsetof=
end(struct xdp_frame, headroom) + 3);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9799  #elif defined(__BI=
G_ENDIAN_BITFIELD)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9800  				      offsetof=
end(struct xdp_frame, headroom));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9801  #endif
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9802  		*insn++ =3D BPF_=
ALU64_REG(BPF_SUB, si->dst_reg, src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9803  		*insn++ =3D BPF_=
MOV64_REG(src_reg, BPF_REG_AX);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9804  		if (si->dst_reg =
=3D=3D si->src_reg)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9805  			*insn++ =3D BPF=
_LDX_MEM(BPF_DW, src_reg, si->src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9806  					      offseto=
f(struct xdp_frame, next));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9807  		break;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9808  	case offsetof(str=
uct xdp_md, data_end):
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9809  		if (si->dst_reg =
=3D=3D si->src_reg) {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9810  			src_reg =3D BPF=
_REG_9;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9811  			if (si->dst_reg=
 =3D=3D src_reg)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9812  				src_reg--;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9813  			*insn++ =3D BPF=
_STX_MEM(BPF_DW, si->src_reg, src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9814  					      offseto=
f(struct xdp_frame, next));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9815  			*insn++ =3D BPF=
_MOV64_REG(src_reg, si->src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9816  		} else {
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9817  			src_reg =3D si-=
>src_reg;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9818  		}
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9819  		/* AX =3D src_reg
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9820                  * =
dst_reg =3D *(src_reg + off(xdp_frame, data))
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9821                  * =
src_reg =3D *(src_reg + off(xdp_frame, len))
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9822                  * =
dst_reg +=3D src_reg
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9823                  * =
src_reg =3D AX
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9824                  */
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9825  		*insn++ =3D BPF_=
MOV64_REG(BPF_REG_AX, src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9826  		*insn++ =3D BPF_=
LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_frame, data),
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9827  				      si->dst_=
reg, src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9828  				      offsetof=
(struct xdp_frame, data));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9829  		// FIXME: Add BU=
ILD_BUG_ON/make this more generic
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9830  		*insn++ =3D BPF_=
LDX_MEM(BPF_H, src_reg, src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9831  				      offsetof=
(struct xdp_frame, len));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9832  		*insn++ =3D BPF_=
ALU64_REG(BPF_ADD, si->dst_reg, src_reg);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9833  		*insn++ =3D BPF_=
MOV64_REG(src_reg, BPF_REG_AX);
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9834  		if (si->dst_reg =
=3D=3D si->src_reg)
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9835  			*insn++ =3D BPF=
_LDX_MEM(BPF_DW, src_reg, si->src_reg,
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9836  					      offseto=
f(struct xdp_frame, next));
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9837  		break;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9838  	}
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9839  	return insn - ins=
n_buf;
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9840  }
bcfe29d7ce3400 Kumar Kartikeya Dwivedi 2022-02-14  9841  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8468293710048512671==--

