Content-Type: multipart/mixed; boundary="===============3483971823946249457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH bpf-next 1/3] bpf: Add support for qp-trie map
Date: Wed, 03 Aug 2022 00:56:42 +0800
Message-ID: <202208030031.e1DW6pCa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3483971823946249457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/bpf_qp_trie.c:595:14: warning: Dereference of null pointer (loaded from v=
ariable 'grand_parent') [clang-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220726130005.3102470-2-houtao1@huawei.com>
References: <20220726130005.3102470-2-houtao1@huawei.com>
TO: Hou Tao <houtao1@huawei.com>

Hi Hou,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/Add-support-=
for-qp-trie-map/20220726-204347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220803/202208030031.e1DW6pCa-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/74890023aaa2d8ffed5=
4d96d4999f10bf14ccfef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/Add-support-for-qp-trie-ma=
p/20220726-204347
        git checkout 74890023aaa2d8ffed54d96d4999f10bf14ccfef
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   kernel/bpf/ringbuf.c:438:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rec, data, size);
           ^~~~~~
   kernel/bpf/ringbuf.c:438:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rec, data, size);
           ^~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   kernel/bpf/bpf_local_storage.c:77:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(SDATA(selem)->data, value, smap->map.valu=
e_size);
                           ^~~~~~
   kernel/bpf/bpf_local_storage.c:77:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(SDATA(selem)->data, value, smap->map.valu=
e_size);
                           ^~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   kernel/bpf/bpf_qp_trie.c:280:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:280:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:285:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&twigs->nodes[p+1], &old->nodes[p+1], (nr - 1 - p=
) * sizeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:285:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&twigs->nodes[p+1], &old->nodes[p+1], (nr - 1 - p=
) * sizeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:313:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:313:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:318:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&twigs->nodes[p+1], &old->nodes[p], (nr - p) * si=
zeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:318:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&twigs->nodes[p+1], &old->nodes[p], (nr - p) * si=
zeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:341:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:341:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(twigs->nodes, old->nodes, p * sizeof(*twigs->node=
s));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:343:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&twigs->nodes[p], &old->nodes[p+1], (nr - 1 - p) =
* sizeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:343:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&twigs->nodes[p], &old->nodes[p+1], (nr - 1 - p) =
* sizeof(*twigs->nodes));
                   ^~~~~~
   kernel/bpf/bpf_qp_trie.c:365:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new, k, key_size);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:365:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(new, k, key_size);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:366:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)new + key_size, v, map->value_size);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:366:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy((void *)new + key_size, v, map->value_size);
           ^~~~~~
>> kernel/bpf/bpf_qp_trie.c:595:14: warning: Dereference of null pointer (l=
oaded from variable 'grand_parent') [clang-analyzer-core.NullDereference]
           old_twigs =3D *grand_parent;
                       ^
   kernel/bpf/bpf_qp_trie.c:998:2: note: Taking false branch
           if (!is_valid_key_data_len(trie_key, map->key_size))
           ^
   kernel/bpf/bpf_qp_trie.c:1002:2: note: Null pointer value stored to 'gra=
nd_parent'
           grand_parent =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_qp_trie.c:1007:6: note: Assuming pointer value is null
           if (!*parent)
               ^~~~~~~~
   kernel/bpf/bpf_qp_trie.c:1007:2: note: Taking false branch
           if (!*parent)
           ^
   kernel/bpf/bpf_qp_trie.c:1011:2: note: Loop condition is false. Executio=
n continues on line 1029
           while (is_branch_node(*node)) {
           ^
   kernel/bpf/bpf_qp_trie.c:1030:2: note: Taking false branch
           if (!is_same_key(found, trie_key))
           ^
   kernel/bpf/bpf_qp_trie.c:1034:6: note: Assuming 'nr' is equal to 2
           if (nr !=3D 2)
               ^~~~~~~
   kernel/bpf/bpf_qp_trie.c:1034:2: note: Taking false branch
           if (nr !=3D 2)
           ^
   kernel/bpf/bpf_qp_trie.c:1037:34: note: Passing null pointer value via 2=
nd parameter 'grand_parent'
                   err =3D qp_trie_merge_node(trie, grand_parent, *parent, =
parent_bitmap, bitmap);
                                                  ^~~~~~~~~~~~
   kernel/bpf/bpf_qp_trie.c:1037:9: note: Calling 'qp_trie_merge_node'
                   err =3D qp_trie_merge_node(trie, grand_parent, *parent, =
parent_bitmap, bitmap);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_qp_trie.c:593:30: note: Assuming 'iip' is not equal to 0
           new_sibling =3D parent->nodes[!iip];
                                       ^~~~
   kernel/bpf/bpf_qp_trie.c:595:14: note: Dereference of null pointer (load=
ed from variable 'grand_parent')
           old_twigs =3D *grand_parent;
                       ^~~~~~~~~~~~~
>> kernel/bpf/bpf_qp_trie.c:648:18: warning: Division by zero [clang-analyz=
er-core.DivideZero]
           for (i =3D 0; i < ARRAY_SIZE(trie->locks); i++)
                           ^
   include/linux/kernel.h:55:38: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_arra=
y(arr))
                            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_qp_trie.c:644:6: note: Assuming 'trie' is non-null
           if (!trie)
               ^~~~~
   kernel/bpf/bpf_qp_trie.c:644:2: note: Taking false branch
           if (!trie)
           ^
   kernel/bpf/bpf_qp_trie.c:648:18: note: Division by zero
           for (i =3D 0; i < ARRAY_SIZE(trie->locks); i++)
                           ^
   include/linux/kernel.h:55:38: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_arra=
y(arr))
                            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_qp_trie.c:727:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, leaf, used);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:727:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(key, leaf, used);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:728:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(key + used, 0, key_size - used);
           ^~~~~~
   kernel/bpf/bpf_qp_trie.c:728:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(key + used, 0, key_size - used);
           ^~~~~~
   Suppressed 41 warnings (39 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/hwtracing/stm/p_sys-t.c:107:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&opriv->node, pn, sizeof(opriv->node));
           ^~~~~~
   drivers/hwtracing/stm/p_sys-t.c:107:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&opriv->node, pn, sizeof(opriv->node));
           ^~~~~~
   drivers/hwtracing/stm/p_sys-t.c:123:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%pU\n", &pn->uuid);
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:123:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%pU\n", &pn->uuid);
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:148:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%d\n", pn->do_len);
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:148:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%d\n", pn->do_len);
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:173:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", jiffies_to_msecs(pn->ts_interval));
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:173:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", jiffies_to_msecs(pn->ts_interval));
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:204:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", jiffies_to_msecs(pn->clocksync_inte=
rval));
                  ^~~~~~~
   drivers/hwtracing/stm/p_sys-t.c:204:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", jiffies_to_msecs(pn->clocksync_inte=
rval));
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   fs/io-wq.c:634:2: warning: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, sizeof(buf), "iou-wrk-%d", wq->task->pid);
           ^~~~~~~~
   fs/io-wq.c:634:2: note: Call to function 'snprintf' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'snprintf_s' in case of C11
           snprintf(buf, sizeof(buf), "iou-wrk-%d", wq->task->pid);

vim +/grand_parent +595 kernel/bpf/bpf_qp_trie.c

74890023aaa2d8 Hou Tao 2022-07-26  582  =

74890023aaa2d8 Hou Tao 2022-07-26  583  static int qp_trie_merge_node(struc=
t qp_trie *trie, struct qp_trie_branch **grand_parent,
74890023aaa2d8 Hou Tao 2022-07-26  584  			      struct qp_trie_branch *par=
ent, unsigned int parent_bitmap,
74890023aaa2d8 Hou Tao 2022-07-26  585  			      unsigned int bitmap)
74890023aaa2d8 Hou Tao 2022-07-26  586  {
74890023aaa2d8 Hou Tao 2022-07-26  587  	struct qp_trie_branch *old_twigs, =
*new_twigs;
74890023aaa2d8 Hou Tao 2022-07-26  588  	struct bpf_map *map =3D &trie->map;
74890023aaa2d8 Hou Tao 2022-07-26  589  	void *new_sibling;
74890023aaa2d8 Hou Tao 2022-07-26  590  	unsigned int iip;
74890023aaa2d8 Hou Tao 2022-07-26  591  =

74890023aaa2d8 Hou Tao 2022-07-26  592  	iip =3D calc_twig_index(parent->bi=
tmap, bitmap);
74890023aaa2d8 Hou Tao 2022-07-26  593  	new_sibling =3D parent->nodes[!iip=
];
74890023aaa2d8 Hou Tao 2022-07-26  594  =

74890023aaa2d8 Hou Tao 2022-07-26 @595  	old_twigs =3D *grand_parent;
74890023aaa2d8 Hou Tao 2022-07-26  596  	new_twigs =3D qp_trie_branch_repla=
ce(map, old_twigs, parent_bitmap, new_sibling);
74890023aaa2d8 Hou Tao 2022-07-26  597  	if (!new_twigs)
74890023aaa2d8 Hou Tao 2022-07-26  598  		return -ENOMEM;
74890023aaa2d8 Hou Tao 2022-07-26  599  =

74890023aaa2d8 Hou Tao 2022-07-26  600  	rcu_assign_pointer(*grand_parent, =
new_twigs);
74890023aaa2d8 Hou Tao 2022-07-26  601  =

74890023aaa2d8 Hou Tao 2022-07-26  602  	qp_trie_branch_free(old_twigs, QP_=
TRIE_TWIGS_FREE_NONE_IDX);
74890023aaa2d8 Hou Tao 2022-07-26  603  	qp_trie_branch_free(parent, iip);
74890023aaa2d8 Hou Tao 2022-07-26  604  =

74890023aaa2d8 Hou Tao 2022-07-26  605  	atomic_dec(&trie->entries);
74890023aaa2d8 Hou Tao 2022-07-26  606  =

74890023aaa2d8 Hou Tao 2022-07-26  607  	return 0;
74890023aaa2d8 Hou Tao 2022-07-26  608  }
74890023aaa2d8 Hou Tao 2022-07-26  609  =

74890023aaa2d8 Hou Tao 2022-07-26  610  /* key and value are allocated toge=
ther in qp_trie_init_leaf_node() */
74890023aaa2d8 Hou Tao 2022-07-26  611  static inline bool is_valid_k_v_siz=
e(unsigned int key_size, unsigned int value_size)
74890023aaa2d8 Hou Tao 2022-07-26  612  {
74890023aaa2d8 Hou Tao 2022-07-26  613  	return round_up((u64)key_size + va=
lue_size, QP_TRIE_LEAF_ALLOC_ALIGN) <=3D
74890023aaa2d8 Hou Tao 2022-07-26  614  	       KMALLOC_MAX_SIZE;
74890023aaa2d8 Hou Tao 2022-07-26  615  }
74890023aaa2d8 Hou Tao 2022-07-26  616  =

74890023aaa2d8 Hou Tao 2022-07-26  617  static int qp_trie_alloc_check(unio=
n bpf_attr *attr)
74890023aaa2d8 Hou Tao 2022-07-26  618  {
74890023aaa2d8 Hou Tao 2022-07-26  619  	if (!bpf_capable())
74890023aaa2d8 Hou Tao 2022-07-26  620  		return -EPERM;
74890023aaa2d8 Hou Tao 2022-07-26  621  =

74890023aaa2d8 Hou Tao 2022-07-26  622  	if (!(attr->map_flags | BPF_F_NO_P=
REALLOC) ||
74890023aaa2d8 Hou Tao 2022-07-26  623  	    attr->map_flags & ~QP_TRIE_CRE=
ATE_FLAG_MASK ||
74890023aaa2d8 Hou Tao 2022-07-26  624  	    !bpf_map_flags_access_ok(attr-=
>map_flags))
74890023aaa2d8 Hou Tao 2022-07-26  625  		return -EINVAL;
74890023aaa2d8 Hou Tao 2022-07-26  626  =

74890023aaa2d8 Hou Tao 2022-07-26  627  	if (!attr->max_entries || attr->ke=
y_size < QP_TRIE_MIN_KEY_SIZE ||
74890023aaa2d8 Hou Tao 2022-07-26  628  	    !attr->value_size)
74890023aaa2d8 Hou Tao 2022-07-26  629  		return -EINVAL;
74890023aaa2d8 Hou Tao 2022-07-26  630  =

74890023aaa2d8 Hou Tao 2022-07-26  631  	if (attr->key_size > QP_TRIE_MAX_K=
EY_SIZE ||
74890023aaa2d8 Hou Tao 2022-07-26  632  	    !is_valid_k_v_size(attr->key_s=
ize, attr->value_size))
74890023aaa2d8 Hou Tao 2022-07-26  633  		return -E2BIG;
74890023aaa2d8 Hou Tao 2022-07-26  634  =

74890023aaa2d8 Hou Tao 2022-07-26  635  	return 0;
74890023aaa2d8 Hou Tao 2022-07-26  636  }
74890023aaa2d8 Hou Tao 2022-07-26  637  =

74890023aaa2d8 Hou Tao 2022-07-26  638  static struct bpf_map *qp_trie_allo=
c(union bpf_attr *attr)
74890023aaa2d8 Hou Tao 2022-07-26  639  {
74890023aaa2d8 Hou Tao 2022-07-26  640  	struct qp_trie *trie;
74890023aaa2d8 Hou Tao 2022-07-26  641  	unsigned int i;
74890023aaa2d8 Hou Tao 2022-07-26  642  =

74890023aaa2d8 Hou Tao 2022-07-26  643  	trie =3D bpf_map_area_alloc(sizeof=
(*trie), bpf_map_attr_numa_node(attr));
74890023aaa2d8 Hou Tao 2022-07-26  644  	if (!trie)
74890023aaa2d8 Hou Tao 2022-07-26  645  		return ERR_PTR(-ENOMEM);
74890023aaa2d8 Hou Tao 2022-07-26  646  =

74890023aaa2d8 Hou Tao 2022-07-26  647  	/* roots are zeroed by bpf_map_are=
a_alloc() */
74890023aaa2d8 Hou Tao 2022-07-26 @648  	for (i =3D 0; i < ARRAY_SIZE(trie-=
>locks); i++)
74890023aaa2d8 Hou Tao 2022-07-26  649  		spin_lock_init(&trie->locks[i]);
74890023aaa2d8 Hou Tao 2022-07-26  650  =

74890023aaa2d8 Hou Tao 2022-07-26  651  	atomic_set(&trie->entries, 0);
74890023aaa2d8 Hou Tao 2022-07-26  652  	bpf_map_init_from_attr(&trie->map,=
 attr);
74890023aaa2d8 Hou Tao 2022-07-26  653  =

74890023aaa2d8 Hou Tao 2022-07-26  654  	return &trie->map;
74890023aaa2d8 Hou Tao 2022-07-26  655  }
74890023aaa2d8 Hou Tao 2022-07-26  656  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3483971823946249457==--

