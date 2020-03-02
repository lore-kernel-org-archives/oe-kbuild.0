Content-Type: multipart/mixed; boundary="===============5256022006802744135=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 4108/4964] kernel/bpf/hashtab.c:1341 __htab_map_lookup_and_delete_batch() warn: potential spectre issue 'htab->buckets' [r] (local cap)
Date: Mon, 02 Mar 2020 11:00:59 +0300
Message-ID: <20200302080059.GC4140@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5256022006802744135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   10569a280f259f696c0b32fc1d45866d2fd33f53
commit: 085fee1a72a9fba101a4a68a2c02fa8bd2b6f913 [4108/4964] bpf: Use recur=
sion prevention helpers in hashtab code
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/hashtab.c:1341 __htab_map_lookup_and_delete_batch() warn: potent=
ial spectre issue 'htab->buckets' [r] (local cap)

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D085fee1a72a9fba101a4a68a2c02fa8bd2b6f913
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 085fee1a72a9fba101a4a68a2c02fa8bd2b6f913
vim +1341 kernel/bpf/hashtab.c

057996380a42bb Yonghong Song   2020-01-15  1265  static int
057996380a42bb Yonghong Song   2020-01-15  1266  __htab_map_lookup_and_dele=
te_batch(struct bpf_map *map,
057996380a42bb Yonghong Song   2020-01-15  1267  				   const union bpf_att=
r *attr,
057996380a42bb Yonghong Song   2020-01-15  1268  				   union bpf_attr __us=
er *uattr,
057996380a42bb Yonghong Song   2020-01-15  1269  				   bool do_delete, boo=
l is_lru_map,
057996380a42bb Yonghong Song   2020-01-15  1270  				   bool is_percpu)
057996380a42bb Yonghong Song   2020-01-15  1271  {
057996380a42bb Yonghong Song   2020-01-15  1272  	struct bpf_htab *htab =3D=
 container_of(map, struct bpf_htab, map);
057996380a42bb Yonghong Song   2020-01-15  1273  	u32 bucket_cnt, total, ke=
y_size, value_size, roundup_key_size;
057996380a42bb Yonghong Song   2020-01-15  1274  	void *keys =3D NULL, *val=
ues =3D NULL, *value, *dst_key, *dst_val;
057996380a42bb Yonghong Song   2020-01-15  1275  	void __user *uvalues =3D =
u64_to_user_ptr(attr->batch.values);
057996380a42bb Yonghong Song   2020-01-15  1276  	void __user *ukeys =3D u6=
4_to_user_ptr(attr->batch.keys);
057996380a42bb Yonghong Song   2020-01-15  1277  	void *ubatch =3D u64_to_u=
ser_ptr(attr->batch.in_batch);
057996380a42bb Yonghong Song   2020-01-15  1278  	u32 batch, max_count, siz=
e, bucket_size;
b9aff38de2cb16 Yonghong Song   2020-02-19  1279  	struct htab_elem *node_to=
_free =3D NULL;
057996380a42bb Yonghong Song   2020-01-15  1280  	u64 elem_map_flags, map_f=
lags;
057996380a42bb Yonghong Song   2020-01-15  1281  	struct hlist_nulls_head *=
head;
057996380a42bb Yonghong Song   2020-01-15  1282  	struct hlist_nulls_node *=
n;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1283  	unsigned long flags =3D 0;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1284  	bool locked =3D false;
057996380a42bb Yonghong Song   2020-01-15  1285  	struct htab_elem *l;
057996380a42bb Yonghong Song   2020-01-15  1286  	struct bucket *b;
057996380a42bb Yonghong Song   2020-01-15  1287  	int ret =3D 0;
057996380a42bb Yonghong Song   2020-01-15  1288  =

057996380a42bb Yonghong Song   2020-01-15  1289  	elem_map_flags =3D attr->=
batch.elem_flags;
057996380a42bb Yonghong Song   2020-01-15  1290  	if ((elem_map_flags & ~BP=
F_F_LOCK) ||
057996380a42bb Yonghong Song   2020-01-15  1291  	    ((elem_map_flags & BP=
F_F_LOCK) && !map_value_has_spin_lock(map)))
057996380a42bb Yonghong Song   2020-01-15  1292  		return -EINVAL;
057996380a42bb Yonghong Song   2020-01-15  1293  =

057996380a42bb Yonghong Song   2020-01-15  1294  	map_flags =3D attr->batch=
.flags;
057996380a42bb Yonghong Song   2020-01-15  1295  	if (map_flags)
057996380a42bb Yonghong Song   2020-01-15  1296  		return -EINVAL;
057996380a42bb Yonghong Song   2020-01-15  1297  =

057996380a42bb Yonghong Song   2020-01-15  1298  	max_count =3D attr->batch=
.count;
057996380a42bb Yonghong Song   2020-01-15  1299  	if (!max_count)
057996380a42bb Yonghong Song   2020-01-15  1300  		return 0;
057996380a42bb Yonghong Song   2020-01-15  1301  =

057996380a42bb Yonghong Song   2020-01-15  1302  	if (put_user(0, &uattr->b=
atch.count))
057996380a42bb Yonghong Song   2020-01-15  1303  		return -EFAULT;
057996380a42bb Yonghong Song   2020-01-15  1304  =

057996380a42bb Yonghong Song   2020-01-15  1305  	batch =3D 0;
057996380a42bb Yonghong Song   2020-01-15  1306  	if (ubatch && copy_from_u=
ser(&batch, ubatch, sizeof(batch)))
057996380a42bb Yonghong Song   2020-01-15  1307  		return -EFAULT;
057996380a42bb Yonghong Song   2020-01-15  1308  =

057996380a42bb Yonghong Song   2020-01-15  1309  	if (batch >=3D htab->n_bu=
ckets)

This this use array_index_nospec() some how?

057996380a42bb Yonghong Song   2020-01-15  1310  		return -ENOENT;
057996380a42bb Yonghong Song   2020-01-15  1311  =

057996380a42bb Yonghong Song   2020-01-15  1312  	key_size =3D htab->map.ke=
y_size;
057996380a42bb Yonghong Song   2020-01-15  1313  	roundup_key_size =3D roun=
d_up(htab->map.key_size, 8);
057996380a42bb Yonghong Song   2020-01-15  1314  	value_size =3D htab->map.=
value_size;
057996380a42bb Yonghong Song   2020-01-15  1315  	size =3D round_up(value_s=
ize, 8);
057996380a42bb Yonghong Song   2020-01-15  1316  	if (is_percpu)
057996380a42bb Yonghong Song   2020-01-15  1317  		value_size =3D size * nu=
m_possible_cpus();
057996380a42bb Yonghong Song   2020-01-15  1318  	total =3D 0;
057996380a42bb Yonghong Song   2020-01-15  1319  	/* while experimenting wi=
th hash tables with sizes ranging from 10 to
057996380a42bb Yonghong Song   2020-01-15  1320  	 * 1000, it was observed =
that a bucket can have upto 5 entries.
057996380a42bb Yonghong Song   2020-01-15  1321  	 */
057996380a42bb Yonghong Song   2020-01-15  1322  	bucket_size =3D 5;
057996380a42bb Yonghong Song   2020-01-15  1323  =

057996380a42bb Yonghong Song   2020-01-15  1324  alloc:
057996380a42bb Yonghong Song   2020-01-15  1325  	/* We cannot do copy_from=
_user or copy_to_user inside
057996380a42bb Yonghong Song   2020-01-15  1326  	 * the rcu_read_lock. All=
ocate enough space here.
057996380a42bb Yonghong Song   2020-01-15  1327  	 */
057996380a42bb Yonghong Song   2020-01-15  1328  	keys =3D kvmalloc(key_siz=
e * bucket_size, GFP_USER | __GFP_NOWARN);
057996380a42bb Yonghong Song   2020-01-15  1329  	values =3D kvmalloc(value=
_size * bucket_size, GFP_USER | __GFP_NOWARN);
057996380a42bb Yonghong Song   2020-01-15  1330  	if (!keys || !values) {
057996380a42bb Yonghong Song   2020-01-15  1331  		ret =3D -ENOMEM;
057996380a42bb Yonghong Song   2020-01-15  1332  		goto after_loop;
057996380a42bb Yonghong Song   2020-01-15  1333  	}
057996380a42bb Yonghong Song   2020-01-15  1334  =

057996380a42bb Yonghong Song   2020-01-15  1335  again:
085fee1a72a9fb Thomas Gleixner 2020-02-24  1336  	bpf_disable_instrumentati=
on();
057996380a42bb Yonghong Song   2020-01-15  1337  	rcu_read_lock();
057996380a42bb Yonghong Song   2020-01-15  1338  again_nocopy:
057996380a42bb Yonghong Song   2020-01-15  1339  	dst_key =3D keys;
057996380a42bb Yonghong Song   2020-01-15  1340  	dst_val =3D values;
057996380a42bb Yonghong Song   2020-01-15 @1341  	b =3D &htab->buckets[batc=
h];
057996380a42bb Yonghong Song   2020-01-15  1342  	head =3D &b->head;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1343  	/* do not grab the lock u=
nless need it (bucket_cnt > 0). */
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1344  	if (locked)
057996380a42bb Yonghong Song   2020-01-15  1345  		raw_spin_lock_irqsave(&b=
->lock, flags);
057996380a42bb Yonghong Song   2020-01-15  1346  =

057996380a42bb Yonghong Song   2020-01-15  1347  	bucket_cnt =3D 0;
057996380a42bb Yonghong Song   2020-01-15  1348  	hlist_nulls_for_each_entr=
y_rcu(l, n, head, hash_node)
057996380a42bb Yonghong Song   2020-01-15  1349  		bucket_cnt++;
057996380a42bb Yonghong Song   2020-01-15  1350  =

492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1351  	if (bucket_cnt && !locked=
) {
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1352  		locked =3D true;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1353  		goto again_nocopy;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1354  	}
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1355  =

057996380a42bb Yonghong Song   2020-01-15  1356  	if (bucket_cnt > (max_cou=
nt - total)) {
057996380a42bb Yonghong Song   2020-01-15  1357  		if (total =3D=3D 0)
057996380a42bb Yonghong Song   2020-01-15  1358  			ret =3D -ENOSPC;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1359  		/* Note that since bucke=
t_cnt > 0 here, it is implicit
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1360  		 * that the locked was g=
rabbed, so release it.
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1361  		 */
057996380a42bb Yonghong Song   2020-01-15  1362  		raw_spin_unlock_irqresto=
re(&b->lock, flags);
057996380a42bb Yonghong Song   2020-01-15  1363  		rcu_read_unlock();
085fee1a72a9fb Thomas Gleixner 2020-02-24  1364  		bpf_enable_instrumentati=
on();
057996380a42bb Yonghong Song   2020-01-15  1365  		goto after_loop;
057996380a42bb Yonghong Song   2020-01-15  1366  	}
057996380a42bb Yonghong Song   2020-01-15  1367  =

057996380a42bb Yonghong Song   2020-01-15  1368  	if (bucket_cnt > bucket_s=
ize) {
057996380a42bb Yonghong Song   2020-01-15  1369  		bucket_size =3D bucket_c=
nt;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1370  		/* Note that since bucke=
t_cnt > 0 here, it is implicit
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1371  		 * that the locked was g=
rabbed, so release it.
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1372  		 */
057996380a42bb Yonghong Song   2020-01-15  1373  		raw_spin_unlock_irqresto=
re(&b->lock, flags);
057996380a42bb Yonghong Song   2020-01-15  1374  		rcu_read_unlock();
085fee1a72a9fb Thomas Gleixner 2020-02-24  1375  		bpf_enable_instrumentati=
on();
057996380a42bb Yonghong Song   2020-01-15  1376  		kvfree(keys);
057996380a42bb Yonghong Song   2020-01-15  1377  		kvfree(values);
057996380a42bb Yonghong Song   2020-01-15  1378  		goto alloc;
057996380a42bb Yonghong Song   2020-01-15  1379  	}
057996380a42bb Yonghong Song   2020-01-15  1380  =

492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1381  	/* Next block is only saf=
e to run if you have grabbed the lock */
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1382  	if (!locked)
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1383  		goto next_batch;
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1384  =

057996380a42bb Yonghong Song   2020-01-15  1385  	hlist_nulls_for_each_entr=
y_safe(l, n, head, hash_node) {
057996380a42bb Yonghong Song   2020-01-15  1386  		memcpy(dst_key, l->key, =
key_size);
057996380a42bb Yonghong Song   2020-01-15  1387  =

057996380a42bb Yonghong Song   2020-01-15  1388  		if (is_percpu) {
057996380a42bb Yonghong Song   2020-01-15  1389  			int off =3D 0, cpu;
057996380a42bb Yonghong Song   2020-01-15  1390  			void __percpu *pptr;
057996380a42bb Yonghong Song   2020-01-15  1391  =

057996380a42bb Yonghong Song   2020-01-15  1392  			pptr =3D htab_elem_get_=
ptr(l, map->key_size);
057996380a42bb Yonghong Song   2020-01-15  1393  			for_each_possible_cpu(c=
pu) {
057996380a42bb Yonghong Song   2020-01-15  1394  				bpf_long_memcpy(dst_va=
l + off,
057996380a42bb Yonghong Song   2020-01-15  1395  						per_cpu_ptr(pptr, cp=
u), size);
057996380a42bb Yonghong Song   2020-01-15  1396  				off +=3D size;
057996380a42bb Yonghong Song   2020-01-15  1397  			}
057996380a42bb Yonghong Song   2020-01-15  1398  		} else {
057996380a42bb Yonghong Song   2020-01-15  1399  			value =3D l->key + roun=
dup_key_size;
057996380a42bb Yonghong Song   2020-01-15  1400  			if (elem_map_flags & BP=
F_F_LOCK)
057996380a42bb Yonghong Song   2020-01-15  1401  				copy_map_value_locked(=
map, dst_val, value,
057996380a42bb Yonghong Song   2020-01-15  1402  						      true);
057996380a42bb Yonghong Song   2020-01-15  1403  			else
057996380a42bb Yonghong Song   2020-01-15  1404  				copy_map_value(map, ds=
t_val, value);
057996380a42bb Yonghong Song   2020-01-15  1405  			check_and_init_map_lock=
(map, dst_val);
057996380a42bb Yonghong Song   2020-01-15  1406  		}
057996380a42bb Yonghong Song   2020-01-15  1407  		if (do_delete) {
057996380a42bb Yonghong Song   2020-01-15  1408  			hlist_nulls_del_rcu(&l-=
>hash_node);
b9aff38de2cb16 Yonghong Song   2020-02-19  1409  =

b9aff38de2cb16 Yonghong Song   2020-02-19  1410  			/* bpf_lru_push_free() =
will acquire lru_lock, which
b9aff38de2cb16 Yonghong Song   2020-02-19  1411  			 * may cause deadlock. =
See comments in function
b9aff38de2cb16 Yonghong Song   2020-02-19  1412  			 * prealloc_lru_pop(). =
Let us do bpf_lru_push_free()
b9aff38de2cb16 Yonghong Song   2020-02-19  1413  			 * after releasing the =
bucket lock.
b9aff38de2cb16 Yonghong Song   2020-02-19  1414  			 */
b9aff38de2cb16 Yonghong Song   2020-02-19  1415  			if (is_lru_map) {
b9aff38de2cb16 Yonghong Song   2020-02-19  1416  				l->batch_flink =3D nod=
e_to_free;
b9aff38de2cb16 Yonghong Song   2020-02-19  1417  				node_to_free =3D l;
b9aff38de2cb16 Yonghong Song   2020-02-19  1418  			} else {
057996380a42bb Yonghong Song   2020-01-15  1419  				free_htab_elem(htab, l=
);
057996380a42bb Yonghong Song   2020-01-15  1420  			}
b9aff38de2cb16 Yonghong Song   2020-02-19  1421  		}
057996380a42bb Yonghong Song   2020-01-15  1422  		dst_key +=3D key_size;
057996380a42bb Yonghong Song   2020-01-15  1423  		dst_val +=3D value_size;
057996380a42bb Yonghong Song   2020-01-15  1424  	}
057996380a42bb Yonghong Song   2020-01-15  1425  =

057996380a42bb Yonghong Song   2020-01-15  1426  	raw_spin_unlock_irqrestor=
e(&b->lock, flags);
492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1427  	locked =3D false;
b9aff38de2cb16 Yonghong Song   2020-02-19  1428  =

b9aff38de2cb16 Yonghong Song   2020-02-19  1429  	while (node_to_free) {
b9aff38de2cb16 Yonghong Song   2020-02-19  1430  		l =3D node_to_free;
b9aff38de2cb16 Yonghong Song   2020-02-19  1431  		node_to_free =3D node_to=
_free->batch_flink;
b9aff38de2cb16 Yonghong Song   2020-02-19  1432  		bpf_lru_push_free(&htab-=
>lru, &l->lru_node);
b9aff38de2cb16 Yonghong Song   2020-02-19  1433  	}
b9aff38de2cb16 Yonghong Song   2020-02-19  1434  =

492e0d0d6f2eb4 Brian Vazquez   2020-02-18  1435  next_batch:
057996380a42bb Yonghong Song   2020-01-15  1436  	/* If we are not copying =
data, we can go to next bucket and avoid
057996380a42bb Yonghong Song   2020-01-15  1437  	 * unlocking the rcu.
057996380a42bb Yonghong Song   2020-01-15  1438  	 */
057996380a42bb Yonghong Song   2020-01-15  1439  	if (!bucket_cnt && (batch=
 + 1 < htab->n_buckets)) {
057996380a42bb Yonghong Song   2020-01-15  1440  		batch++;
057996380a42bb Yonghong Song   2020-01-15  1441  		goto again_nocopy;
057996380a42bb Yonghong Song   2020-01-15  1442  	}
057996380a42bb Yonghong Song   2020-01-15  1443  =

057996380a42bb Yonghong Song   2020-01-15  1444  	rcu_read_unlock();
085fee1a72a9fb Thomas Gleixner 2020-02-24  1445  	bpf_enable_instrumentatio=
n();
057996380a42bb Yonghong Song   2020-01-15  1446  	if (bucket_cnt && (copy_t=
o_user(ukeys + total * key_size, keys,
057996380a42bb Yonghong Song   2020-01-15  1447  	    key_size * bucket_cnt=
) ||
057996380a42bb Yonghong Song   2020-01-15  1448  	    copy_to_user(uvalues =
+ total * value_size, values,
057996380a42bb Yonghong Song   2020-01-15  1449  	    value_size * bucket_c=
nt))) {
057996380a42bb Yonghong Song   2020-01-15  1450  		ret =3D -EFAULT;
057996380a42bb Yonghong Song   2020-01-15  1451  		goto after_loop;
057996380a42bb Yonghong Song   2020-01-15  1452  	}
057996380a42bb Yonghong Song   2020-01-15  1453  =

057996380a42bb Yonghong Song   2020-01-15  1454  	total +=3D bucket_cnt;
057996380a42bb Yonghong Song   2020-01-15  1455  	batch++;
057996380a42bb Yonghong Song   2020-01-15  1456  	if (batch >=3D htab->n_bu=
ckets) {
057996380a42bb Yonghong Song   2020-01-15  1457  		ret =3D -ENOENT;
057996380a42bb Yonghong Song   2020-01-15  1458  		goto after_loop;
057996380a42bb Yonghong Song   2020-01-15  1459  	}
057996380a42bb Yonghong Song   2020-01-15  1460  	goto again;
057996380a42bb Yonghong Song   2020-01-15  1461  =

057996380a42bb Yonghong Song   2020-01-15  1462  after_loop:
057996380a42bb Yonghong Song   2020-01-15  1463  	if (ret =3D=3D -EFAULT)
057996380a42bb Yonghong Song   2020-01-15  1464  		goto out;
057996380a42bb Yonghong Song   2020-01-15  1465  =

057996380a42bb Yonghong Song   2020-01-15  1466  	/* copy # of entries and =
next batch */
057996380a42bb Yonghong Song   2020-01-15  1467  	ubatch =3D u64_to_user_pt=
r(attr->batch.out_batch);
057996380a42bb Yonghong Song   2020-01-15  1468  	if (copy_to_user(ubatch, =
&batch, sizeof(batch)) ||
057996380a42bb Yonghong Song   2020-01-15  1469  	    put_user(total, &uatt=
r->batch.count))
057996380a42bb Yonghong Song   2020-01-15  1470  		ret =3D -EFAULT;
057996380a42bb Yonghong Song   2020-01-15  1471  =

057996380a42bb Yonghong Song   2020-01-15  1472  out:
057996380a42bb Yonghong Song   2020-01-15  1473  	kvfree(keys);
057996380a42bb Yonghong Song   2020-01-15  1474  	kvfree(values);
057996380a42bb Yonghong Song   2020-01-15  1475  	return ret;
057996380a42bb Yonghong Song   2020-01-15  1476  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5256022006802744135==--

