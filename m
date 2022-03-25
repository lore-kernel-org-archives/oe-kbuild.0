Content-Type: multipart/mixed; boundary="===============8429964158271698993=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC bpf-next 1/2] bpf: Mmapable local storage.
Date: Fri, 25 Mar 2022 15:53:36 +0800
Message-ID: <202203251506.EuMlgJWs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8429964158271698993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220324234123.1608337-2-haoluo@google.com>
References: <20220324234123.1608337-2-haoluo@google.com>
TO: Hao Luo <haoluo@google.com>

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Mmapable-task-loca=
l-storage/20220325-074313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
325/202203251506.EuMlgJWs-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/bpf_task_storage.c:342 task_storage_map_mmap() error: we previou=
sly assumed 'sdata' could be null (see line 327)

vim +/sdata +342 kernel/bpf/bpf_task_storage.c

4cf1bc1f104520 KP Singh 2020-11-06  309  =

e8fe1745ccea53 Hao Luo  2022-03-24  310  static int task_storage_map_mmap(s=
truct bpf_map *map, struct vm_area_struct *vma)
e8fe1745ccea53 Hao Luo  2022-03-24  311  {
e8fe1745ccea53 Hao Luo  2022-03-24  312  	struct bpf_local_storage_map *sma=
p;
e8fe1745ccea53 Hao Luo  2022-03-24  313  	struct bpf_local_storage_data *sd=
ata;
e8fe1745ccea53 Hao Luo  2022-03-24  314  	int err;
e8fe1745ccea53 Hao Luo  2022-03-24  315  =

e8fe1745ccea53 Hao Luo  2022-03-24  316  	if (!(map->map_flags & BPF_F_MMAP=
ABLE))
e8fe1745ccea53 Hao Luo  2022-03-24  317  		return -EINVAL;
e8fe1745ccea53 Hao Luo  2022-03-24  318  =

e8fe1745ccea53 Hao Luo  2022-03-24  319  	rcu_read_lock();
e8fe1745ccea53 Hao Luo  2022-03-24  320  	if (!bpf_task_storage_trylock()) {
e8fe1745ccea53 Hao Luo  2022-03-24  321  		rcu_read_unlock();
e8fe1745ccea53 Hao Luo  2022-03-24  322  		return -EBUSY;
e8fe1745ccea53 Hao Luo  2022-03-24  323  	}
e8fe1745ccea53 Hao Luo  2022-03-24  324  =

e8fe1745ccea53 Hao Luo  2022-03-24  325  	smap =3D (struct bpf_local_storag=
e_map *)map;
e8fe1745ccea53 Hao Luo  2022-03-24  326  	sdata =3D task_storage_lookup(cur=
rent, map, true);
e8fe1745ccea53 Hao Luo  2022-03-24 @327  	if (sdata) {
e8fe1745ccea53 Hao Luo  2022-03-24  328  		err =3D bpf_local_storage_mmap(s=
map, sdata->data, vma);
e8fe1745ccea53 Hao Luo  2022-03-24  329  		goto unlock;
e8fe1745ccea53 Hao Luo  2022-03-24  330  	}
e8fe1745ccea53 Hao Luo  2022-03-24  331  =

e8fe1745ccea53 Hao Luo  2022-03-24  332  	/* only allocate new storage, whe=
n the task is refcounted */
e8fe1745ccea53 Hao Luo  2022-03-24  333  	if (refcount_read(&current->usage=
)) {
e8fe1745ccea53 Hao Luo  2022-03-24  334  		sdata =3D bpf_local_storage_upda=
te(current, smap, NULL,
e8fe1745ccea53 Hao Luo  2022-03-24  335  						 BPF_NOEXIST, GFP_ATOMIC);
e8fe1745ccea53 Hao Luo  2022-03-24  336  		if (IS_ERR(sdata)) {
e8fe1745ccea53 Hao Luo  2022-03-24  337  			err =3D PTR_ERR(sdata);
e8fe1745ccea53 Hao Luo  2022-03-24  338  			goto unlock;
e8fe1745ccea53 Hao Luo  2022-03-24  339  		}
e8fe1745ccea53 Hao Luo  2022-03-24  340  	}
e8fe1745ccea53 Hao Luo  2022-03-24  341  =

e8fe1745ccea53 Hao Luo  2022-03-24 @342  	err =3D bpf_local_storage_mmap(sm=
ap, sdata->data, vma);
e8fe1745ccea53 Hao Luo  2022-03-24  343  unlock:
e8fe1745ccea53 Hao Luo  2022-03-24  344  	bpf_task_storage_unlock();
e8fe1745ccea53 Hao Luo  2022-03-24  345  	rcu_read_unlock();
e8fe1745ccea53 Hao Luo  2022-03-24  346  	return err;
e8fe1745ccea53 Hao Luo  2022-03-24  347  }
e8fe1745ccea53 Hao Luo  2022-03-24  348  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8429964158271698993==--

