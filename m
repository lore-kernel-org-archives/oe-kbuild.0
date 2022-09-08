Content-Type: multipart/mixed; boundary="===============6634730183087257084=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] bpf: introduce new bpf map type BPF_MAP_TYPE_WILDCARD
Date: Thu, 08 Sep 2022 15:30:11 +0800
Message-ID: <202209081532.b7uALtT8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6634730183087257084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220907080140.290413-1-aspsk@isovalent.com>
References: <20220907080140.290413-1-aspsk@isovalent.com>
TO: Anton Protopopov <aspsk@isovalent.com>

Hi Anton,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf=
-introduce-new-bpf-map-type-BPF_MAP_TYPE_WILDCARD/20220907-160629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
908/202209081532.b7uALtT8-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/wildcard.c:1333 wildcard_map_lookup_elem() error: uninitialized =
symbol 'l'.

vim +/l +1333 kernel/bpf/wildcard.c

692616731b1a8b Anton Protopopov 2022-09-07  1301  =

692616731b1a8b Anton Protopopov 2022-09-07  1302  static void *wildcard_map=
_lookup_elem(struct bpf_map *map, void *key)
692616731b1a8b Anton Protopopov 2022-09-07  1303  {
692616731b1a8b Anton Protopopov 2022-09-07  1304  	struct bpf_wildcard *wca=
rd =3D
692616731b1a8b Anton Protopopov 2022-09-07  1305  		container_of(map, struc=
t bpf_wildcard, map);
692616731b1a8b Anton Protopopov 2022-09-07  1306  	struct wcard_elem *l;
692616731b1a8b Anton Protopopov 2022-09-07  1307  =

692616731b1a8b Anton Protopopov 2022-09-07  1308  	switch (((struct wildcar=
d_key *)key)->type) {
692616731b1a8b Anton Protopopov 2022-09-07  1309  	case BPF_WILDCARD_KEY_RU=
LE:
692616731b1a8b Anton Protopopov 2022-09-07  1310  		switch (wcard->algorith=
m) {
692616731b1a8b Anton Protopopov 2022-09-07  1311  		case BPF_WILDCARD_F_ALG=
ORITHM_BF:
692616731b1a8b Anton Protopopov 2022-09-07  1312  			l =3D bf_lookup(wcard,=
 key);
692616731b1a8b Anton Protopopov 2022-09-07  1313  			break;
692616731b1a8b Anton Protopopov 2022-09-07  1314  		case BPF_WILDCARD_F_ALG=
ORITHM_TM:
692616731b1a8b Anton Protopopov 2022-09-07  1315  			l =3D tm_lookup(wcard,=
 key);
692616731b1a8b Anton Protopopov 2022-09-07  1316  			break;
692616731b1a8b Anton Protopopov 2022-09-07  1317  		}
692616731b1a8b Anton Protopopov 2022-09-07  1318  		break;
692616731b1a8b Anton Protopopov 2022-09-07  1319  	case BPF_WILDCARD_KEY_EL=
EM:
692616731b1a8b Anton Protopopov 2022-09-07  1320  		switch (wcard->algorith=
m) {
692616731b1a8b Anton Protopopov 2022-09-07  1321  		case BPF_WILDCARD_F_ALG=
ORITHM_BF:
692616731b1a8b Anton Protopopov 2022-09-07  1322  			l =3D bf_match(wcard, =
key);
692616731b1a8b Anton Protopopov 2022-09-07  1323  			break;
692616731b1a8b Anton Protopopov 2022-09-07  1324  		case BPF_WILDCARD_F_ALG=
ORITHM_TM:
692616731b1a8b Anton Protopopov 2022-09-07  1325  			l =3D tm_match(wcard, =
key);
692616731b1a8b Anton Protopopov 2022-09-07  1326  			break;
692616731b1a8b Anton Protopopov 2022-09-07  1327  		}
692616731b1a8b Anton Protopopov 2022-09-07  1328  		break;
692616731b1a8b Anton Protopopov 2022-09-07  1329  	default:
692616731b1a8b Anton Protopopov 2022-09-07  1330  		return ERR_PTR(-EINVAL);
692616731b1a8b Anton Protopopov 2022-09-07  1331  	}
692616731b1a8b Anton Protopopov 2022-09-07  1332  =

692616731b1a8b Anton Protopopov 2022-09-07 @1333  	if (l)
692616731b1a8b Anton Protopopov 2022-09-07  1334  		return l->key + round_u=
p(wcard->map.key_size, 8);
692616731b1a8b Anton Protopopov 2022-09-07  1335  =

692616731b1a8b Anton Protopopov 2022-09-07  1336  	return ERR_PTR(-ENOENT);
692616731b1a8b Anton Protopopov 2022-09-07  1337  }
692616731b1a8b Anton Protopopov 2022-09-07  1338  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6634730183087257084==--

