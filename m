Content-Type: multipart/mixed; boundary="===============6902309432407990563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cilium:pr/meta5 4/7] kernel/bpf/net.c:35:14: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207231130.qBeYc4uo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6902309432407990563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/net.c:35:14: warning: use of uninitialized value '<unknown>' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/meta5
head:   7033821ae5e03647290a224e76b72fe98a45ab07
commit: fafe94e50da7d56dd12f94a7bf97a0e3a9dda12d [4/7] bpf: Add initial fd-=
based API to attach tc BPF programs
:::::: branch date: 12 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-c002-20220722 (https://download.01.org/0day-ci/archi=
ve/20220723/202207231130.qBeYc4uo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/cilium/linux/commit/fafe94e50da7d56dd12f94a7bf=
97a0e3a9dda12d
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/meta5
        git checkout fafe94e50da7d56dd12f94a7bf97a0e3a9dda12d
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   kernel/bpf/net.c: In function '__sch_prog_attach':
>> kernel/bpf/net.c:35:14: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      35 |         bool created;
         |              ^~~~~~~
     '__sch_prog_attach': event 1
       |
       |   35 |         bool created;
       |      |              ^~~~~~~
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |
   kernel/bpf/net.c: In function '__sch_prog_query':
   kernel/bpf/net.c:226:27: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     226 |         u32 i, flags =3D 0, cnt;
         |                           ^~~
     '__sch_prog_query': event 1
       |
       |  226 |         u32 i, flags =3D 0, cnt;
       |      |                           ^~~
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |

vim +35 kernel/bpf/net.c

fafe94e50da7d5 Daniel Borkmann 2022-06-13  28  =

fafe94e50da7d5 Daniel Borkmann 2022-06-13  29  static int __sch_prog_attach=
(struct net_device *dev, bool ingress, u32 limit,
fafe94e50da7d5 Daniel Borkmann 2022-06-13  30  			     struct bpf_prog *npr=
og, u32 prio, u32 flags)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  31  {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  32  	struct bpf_prog_array_item =
*item, *tmp;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  33  	struct sch_entry *entry, *p=
eer;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  34  	struct bpf_prog *oprog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13 @35  	bool created;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  36  	int i, j;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  37  =

fafe94e50da7d5 Daniel Borkmann 2022-06-13  38  	entry =3D dev_sch_entry_fet=
ch(dev, ingress, &created);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  39  	if (!entry)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  40  		return -ENOMEM;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  41  	for (i =3D 0; i < limit; i+=
+) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  42  		item =3D &entry->items[i];
fafe94e50da7d5 Daniel Borkmann 2022-06-13  43  		oprog =3D item->prog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  44  		if (!oprog)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  45  			break;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  46  		if (item->bpf_priority =3D=
=3D prio) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  47  			if (flags & BPF_F_REPLACE=
) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  48  				/* Pairs with READ_ONCE(=
) in sch_run_progs(). */
fafe94e50da7d5 Daniel Borkmann 2022-06-13  49  				WRITE_ONCE(item->prog, n=
prog);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  50  				if (sch_prog_refcounted(=
oprog))
fafe94e50da7d5 Daniel Borkmann 2022-06-13  51  					bpf_prog_put(oprog);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  52  				dev_sch_entry_prio_set(e=
ntry, prio, nprog);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  53  				return prio;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  54  			}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  55  			return -EBUSY;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  56  		}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  57  	}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  58  	if (dev_sch_entry_total(ent=
ry) >=3D limit)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  59  		return -ENOSPC;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  60  	prio =3D dev_sch_entry_prio=
_new(entry, prio, nprog);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  61  	if (prio < 0) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  62  		if (created)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  63  			dev_sch_entry_free(entry);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  64  		return -ENOMEM;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  65  	}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  66  	peer =3D dev_sch_entry_peer=
(entry);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  67  	dev_sch_entry_clear(peer);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  68  	for (i =3D 0, j =3D 0; i < =
limit; i++, j++) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  69  		item =3D &entry->items[i];
fafe94e50da7d5 Daniel Borkmann 2022-06-13  70  		tmp =3D &peer->items[j];
fafe94e50da7d5 Daniel Borkmann 2022-06-13  71  		oprog =3D item->prog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  72  		if (!oprog) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  73  			if (i =3D=3D j) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  74  				tmp->prog =3D nprog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  75  				tmp->bpf_priority =3D pr=
io;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  76  			}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  77  			break;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  78  		} else if (item->bpf_prior=
ity < prio) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  79  			tmp->prog =3D oprog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  80  			tmp->bpf_priority =3D ite=
m->bpf_priority;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  81  		} else if (item->bpf_prior=
ity > prio) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  82  			if (i =3D=3D j) {
fafe94e50da7d5 Daniel Borkmann 2022-06-13  83  				tmp->prog =3D nprog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  84  				tmp->bpf_priority =3D pr=
io;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  85  				tmp =3D &peer->items[++j=
];
fafe94e50da7d5 Daniel Borkmann 2022-06-13  86  			}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  87  			tmp->prog =3D oprog;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  88  			tmp->bpf_priority =3D ite=
m->bpf_priority;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  89  		}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  90  	}
fafe94e50da7d5 Daniel Borkmann 2022-06-13  91  	dev_sch_entry_update(dev, p=
eer, ingress);
fafe94e50da7d5 Daniel Borkmann 2022-06-13  92  	if (ingress)
fafe94e50da7d5 Daniel Borkmann 2022-06-13  93  		net_inc_ingress_queue();
fafe94e50da7d5 Daniel Borkmann 2022-06-13  94  	else
fafe94e50da7d5 Daniel Borkmann 2022-06-13  95  		net_inc_egress_queue();
fafe94e50da7d5 Daniel Borkmann 2022-06-13  96  	return prio;
fafe94e50da7d5 Daniel Borkmann 2022-06-13  97  }
fafe94e50da7d5 Daniel Borkmann 2022-06-13  98  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6902309432407990563==--

