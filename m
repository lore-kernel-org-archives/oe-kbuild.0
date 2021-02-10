Content-Type: multipart/mixed; boundary="===============1522313596997246621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bcache:for-next 8/19] drivers/md/bcache/nvm-pages.c:159:4: warning: Either the condition '!extents' is redundant or there is possible null pointer dereference: extents.
Date: Wed, 10 Feb 2021 21:11:04 +0800
Message-ID: <202102102148.nBEmXyFu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1522313596997246621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Qiaowei Ren <qiaowei.ren@intel.com>
CC: Coly Li <colyli@suse.de>
CC: Jianpeng Ma <jianpeng.ma@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache=
.git for-next
head:   78729af1b480ca5a3edb9547b97b59ed3dd72440
commit: 384227b99f413137d2b0548c364153690be8cbd1 [8/19] bcache: initialize =
the nvm pages allocator
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/md/bcache/nvm-pages.c:
>> drivers/md/bcache/nvm-pages.c:159:4: warning: Either the condition '!ext=
ents' is redundant or there is possible null pointer dereference: extents. =
[nullPointerRedundantCheck]
      extents->ns =3D only_set->nss[j];
      ^
   drivers/md/bcache/nvm-pages.c:169:10: note: Assuming that condition '!ex=
tents' is not redundant
        if (!extents) {
            ^
   drivers/md/bcache/nvm-pages.c:159:4: note: Null pointer dereference
      extents->ns =3D only_set->nss[j];
      ^

vim +159 drivers/md/bcache/nvm-pages.c

384227b99f4131 Qiaowei Ren 2021-02-08  114  =

384227b99f4131 Qiaowei Ren 2021-02-08  115  static int init_owner_info(stru=
ct bch_nvm_namespace *ns)
384227b99f4131 Qiaowei Ren 2021-02-08  116  {
384227b99f4131 Qiaowei Ren 2021-02-08  117  	struct bch_owner_list_head *ow=
ner_list_head;
384227b99f4131 Qiaowei Ren 2021-02-08  118  	struct bch_nvm_pages_owner_hea=
d *owner_head;
384227b99f4131 Qiaowei Ren 2021-02-08  119  	struct bch_nvm_pgalloc_recs *n=
vm_pgalloc_recs;
384227b99f4131 Qiaowei Ren 2021-02-08  120  	struct bch_owner_list *owner_l=
ist;
384227b99f4131 Qiaowei Ren 2021-02-08  121  	struct bch_nvm_alloced_recs *e=
xtents;
384227b99f4131 Qiaowei Ren 2021-02-08  122  	struct bch_extent *extent;
384227b99f4131 Qiaowei Ren 2021-02-08  123  	u32 i, j, k;
384227b99f4131 Qiaowei Ren 2021-02-08  124  =

384227b99f4131 Qiaowei Ren 2021-02-08  125  	owner_list_head =3D (struct bc=
h_owner_list_head *)
384227b99f4131 Qiaowei Ren 2021-02-08  126  			(ns->kaddr + BCH_NVM_PAGES_O=
WNER_LIST_HEAD_OFFSET);
384227b99f4131 Qiaowei Ren 2021-02-08  127  =

384227b99f4131 Qiaowei Ren 2021-02-08  128  	mutex_lock(&only_set->lock);
384227b99f4131 Qiaowei Ren 2021-02-08  129  	only_set->owner_list_size =3D =
owner_list_head->size;
384227b99f4131 Qiaowei Ren 2021-02-08  130  	only_set->owner_list_used =3D =
owner_list_head->used;
384227b99f4131 Qiaowei Ren 2021-02-08  131  =

384227b99f4131 Qiaowei Ren 2021-02-08  132  	for (i =3D 0; i < owner_list_h=
ead->used; i++) {
384227b99f4131 Qiaowei Ren 2021-02-08  133  		owner_head =3D &owner_list_he=
ad->heads[i];
384227b99f4131 Qiaowei Ren 2021-02-08  134  		owner_list =3D alloc_owner_li=
st(owner_head->uuid, owner_head->label,
384227b99f4131 Qiaowei Ren 2021-02-08  135  				only_set->total_namespaces_=
nr);
384227b99f4131 Qiaowei Ren 2021-02-08  136  		if (!owner_list) {
384227b99f4131 Qiaowei Ren 2021-02-08  137  			mutex_unlock(&only_set->lock=
);
384227b99f4131 Qiaowei Ren 2021-02-08  138  			return -ENOMEM;
384227b99f4131 Qiaowei Ren 2021-02-08  139  		}
384227b99f4131 Qiaowei Ren 2021-02-08  140  =

384227b99f4131 Qiaowei Ren 2021-02-08  141  		for (j =3D 0; j < only_set->t=
otal_namespaces_nr; j++) {
384227b99f4131 Qiaowei Ren 2021-02-08  142  			if (!only_set->nss[j] || !ow=
ner_head->recs[j])
384227b99f4131 Qiaowei Ren 2021-02-08  143  				continue;
384227b99f4131 Qiaowei Ren 2021-02-08  144  =

384227b99f4131 Qiaowei Ren 2021-02-08  145  			nvm_pgalloc_recs =3D (struct=
 bch_nvm_pgalloc_recs *)
384227b99f4131 Qiaowei Ren 2021-02-08  146  					((long)owner_head->recs[j]=
 + ns->kaddr);
384227b99f4131 Qiaowei Ren 2021-02-08  147  			if (memcmp(nvm_pgalloc_recs-=
>magic, bch_nvm_pages_pgalloc_magic, 16)) {
384227b99f4131 Qiaowei Ren 2021-02-08  148  				pr_info("invalid bch_nvmpag=
es_pgalloc_magic\n");
384227b99f4131 Qiaowei Ren 2021-02-08  149  				mutex_unlock(&only_set->loc=
k);
384227b99f4131 Qiaowei Ren 2021-02-08  150  				return -EINVAL;
384227b99f4131 Qiaowei Ren 2021-02-08  151  			}
384227b99f4131 Qiaowei Ren 2021-02-08  152  =

384227b99f4131 Qiaowei Ren 2021-02-08  153  			extents =3D kzalloc(sizeof(*=
extents), GFP_KERNEL);
384227b99f4131 Qiaowei Ren 2021-02-08  154  			if (!extents) {
384227b99f4131 Qiaowei Ren 2021-02-08  155  				mutex_unlock(&only_set->loc=
k);
384227b99f4131 Qiaowei Ren 2021-02-08  156  				return -ENOMEM;
384227b99f4131 Qiaowei Ren 2021-02-08  157  			}
384227b99f4131 Qiaowei Ren 2021-02-08  158  =

384227b99f4131 Qiaowei Ren 2021-02-08 @159  			extents->ns =3D only_set->ns=
s[j];
384227b99f4131 Qiaowei Ren 2021-02-08  160  			INIT_LIST_HEAD(&extents->ext=
ent_head);
384227b99f4131 Qiaowei Ren 2021-02-08  161  			owner_list->alloced_recs[j] =
=3D extents;
384227b99f4131 Qiaowei Ren 2021-02-08  162  =

384227b99f4131 Qiaowei Ren 2021-02-08  163  			do {
384227b99f4131 Qiaowei Ren 2021-02-08  164  				struct bch_pgalloc_rec *rec;
384227b99f4131 Qiaowei Ren 2021-02-08  165  =

384227b99f4131 Qiaowei Ren 2021-02-08  166  				for (k =3D 0; k < nvm_pgall=
oc_recs->used; k++) {
384227b99f4131 Qiaowei Ren 2021-02-08  167  					rec =3D &nvm_pgalloc_recs-=
>recs[k];
384227b99f4131 Qiaowei Ren 2021-02-08  168  					extent =3D kzalloc(sizeof(=
*extent), GFP_KERNEL);
384227b99f4131 Qiaowei Ren 2021-02-08  169  					if (!extents) {
384227b99f4131 Qiaowei Ren 2021-02-08  170  						mutex_unlock(&only_set->l=
ock);
384227b99f4131 Qiaowei Ren 2021-02-08  171  						return -ENOMEM;
384227b99f4131 Qiaowei Ren 2021-02-08  172  					}
384227b99f4131 Qiaowei Ren 2021-02-08  173  					extent->kaddr =3D nvm_pgof=
f_to_vaddr(extents->ns, rec->pgoff);
384227b99f4131 Qiaowei Ren 2021-02-08  174  					extent->nr =3D rec->nr;
384227b99f4131 Qiaowei Ren 2021-02-08  175  					list_add_tail(&extent->lis=
t, &extents->extent_head);
384227b99f4131 Qiaowei Ren 2021-02-08  176  				}
384227b99f4131 Qiaowei Ren 2021-02-08  177  				extents->nr +=3D nvm_pgallo=
c_recs->used;
384227b99f4131 Qiaowei Ren 2021-02-08  178  =

384227b99f4131 Qiaowei Ren 2021-02-08  179  				if (nvm_pgalloc_recs->next)=
 {
384227b99f4131 Qiaowei Ren 2021-02-08  180  					nvm_pgalloc_recs =3D (stru=
ct bch_nvm_pgalloc_recs *)
384227b99f4131 Qiaowei Ren 2021-02-08  181  						((long)nvm_pgalloc_recs->=
next + ns->kaddr);
384227b99f4131 Qiaowei Ren 2021-02-08  182  					if (memcmp(nvm_pgalloc_rec=
s->magic,
384227b99f4131 Qiaowei Ren 2021-02-08  183  						bch_nvm_pages_pgalloc_mag=
ic, 16)) {
384227b99f4131 Qiaowei Ren 2021-02-08  184  						pr_info("invalid bch_nvmp=
ages_pgalloc_magic\n");
384227b99f4131 Qiaowei Ren 2021-02-08  185  						mutex_unlock(&only_set->l=
ock);
384227b99f4131 Qiaowei Ren 2021-02-08  186  						return -EINVAL;
384227b99f4131 Qiaowei Ren 2021-02-08  187  					}
384227b99f4131 Qiaowei Ren 2021-02-08  188  				} else
384227b99f4131 Qiaowei Ren 2021-02-08  189  					nvm_pgalloc_recs =3D NULL;
384227b99f4131 Qiaowei Ren 2021-02-08  190  			} while (nvm_pgalloc_recs);
384227b99f4131 Qiaowei Ren 2021-02-08  191  		}
384227b99f4131 Qiaowei Ren 2021-02-08  192  		only_set->owner_lists[i] =3D =
owner_list;
384227b99f4131 Qiaowei Ren 2021-02-08  193  		owner_list->nvm_set =3D only_=
set;
384227b99f4131 Qiaowei Ren 2021-02-08  194  	}
384227b99f4131 Qiaowei Ren 2021-02-08  195  	mutex_unlock(&only_set->lock);
384227b99f4131 Qiaowei Ren 2021-02-08  196  =

384227b99f4131 Qiaowei Ren 2021-02-08  197  	return 0;
384227b99f4131 Qiaowei Ren 2021-02-08  198  }
384227b99f4131 Qiaowei Ren 2021-02-08  199  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1522313596997246621==--

