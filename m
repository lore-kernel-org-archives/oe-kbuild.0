Content-Type: multipart/mixed; boundary="===============1584995775250119692=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [dhowells-fs:fscache-next 10/11] fs/cachefiles/interface.c:101 cachefiles_alloc_object() error: uninitialized symbol 'lookup_data'.
Date: Mon, 04 Nov 2019 09:56:53 +0300
Message-ID: <20191104065653.GF21796@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1584995775250119692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it fscache-next
head:   a378de860278da7a006db7135ce24cf56cd8b552
commit: 22691addb04f46468ead9648b7e95d213312c82f [10/11] cachefiles: Reduce=
 cleanup in cachefiles_alloc_object()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/cachefiles/interface.c:101 cachefiles_alloc_object() error: uninitialize=
d symbol 'lookup_data'.

# https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/com=
mit/?id=3D22691addb04f46468ead9648b7e95d213312c82f
git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/=
dhowells/linux-fs.git
git remote update dhowells-fs
git checkout 22691addb04f46468ead9648b7e95d213312c82f
vim +/lookup_data +101 fs/cachefiles/interface.c

9ae326a69004de David Howells 2009-04-03   26  static struct fscache_object =
*cachefiles_alloc_object(
9ae326a69004de David Howells 2009-04-03   27  	struct fscache_cache *_cache,
9ae326a69004de David Howells 2009-04-03   28  	struct fscache_cookie *cooki=
e)
9ae326a69004de David Howells 2009-04-03   29  {
9ae326a69004de David Howells 2009-04-03   30  	struct cachefiles_lookup_dat=
a *lookup_data;

This is only used for the sizeof().

9ae326a69004de David Howells 2009-04-03   31  	struct cachefiles_object *ob=
ject;
9ae326a69004de David Howells 2009-04-03   32  	struct cachefiles_cache *cac=
he;
9ae326a69004de David Howells 2009-04-03   33  	struct cachefiles_xattr *aux=
data;
9ae326a69004de David Howells 2009-04-03   34  	unsigned keylen, auxlen;
402cb8dda949d9 David Howells 2018-04-04   35  	void *buffer, *p;
9ae326a69004de David Howells 2009-04-03   36  =

9ae326a69004de David Howells 2009-04-03   37  	cache =3D container_of(_cach=
e, struct cachefiles_cache, cache);
9ae326a69004de David Howells 2009-04-03   38  =

9ae326a69004de David Howells 2009-04-03   39  	_enter("{%s},%p,", cache->ca=
che.identifier, cookie);
9ae326a69004de David Howells 2009-04-03   40  =

9ae326a69004de David Howells 2009-04-03   41  	/* create a new object recor=
d and a temporary leaf image */
6feed675ec5813 David Howells 2019-10-31   42  	object =3D kmem_cache_zalloc=
(cachefiles_object_jar, cachefiles_gfp);
9ae326a69004de David Howells 2009-04-03   43  	if (!object)
22691addb04f46 David Howells 2019-10-31   44  		goto nomem;
9ae326a69004de David Howells 2009-04-03   45  =

9ae326a69004de David Howells 2009-04-03   46  	ASSERTCMP(object->backer, =
=3D=3D, NULL);
9ae326a69004de David Howells 2009-04-03   47  =

9ae326a69004de David Howells 2009-04-03   48  	BUG_ON(test_bit(CACHEFILES_O=
BJECT_ACTIVE, &object->flags));
9ae326a69004de David Howells 2009-04-03   49  	atomic_set(&object->usage, 1=
);
6feed675ec5813 David Howells 2019-10-31   50  	spin_lock_init(&object->work=
_lock);
9ae326a69004de David Howells 2009-04-03   51  =

9ae326a69004de David Howells 2009-04-03   52  	fscache_object_init(&object-=
>fscache, cookie, &cache->cache);
9ae326a69004de David Howells 2009-04-03   53  =

9ae326a69004de David Howells 2009-04-03   54  	object->type =3D cookie->def=
->type;
9ae326a69004de David Howells 2009-04-03   55  =

22691addb04f46 David Howells 2019-10-31   56  	object->lookup_data =3D kzal=
loc(sizeof(*lookup_data), cachefiles_gfp);
                                                                           =
         ^^^^^^^^^^^^^^

22691addb04f46 David Howells 2019-10-31   57  	if (!object->lookup_data)
22691addb04f46 David Howells 2019-10-31   58  		goto nomem_object;
22691addb04f46 David Howells 2019-10-31   59  =

9ae326a69004de David Howells 2009-04-03   60  	/* get hold of the raw key
9ae326a69004de David Howells 2009-04-03   61  	 * - stick the length on the=
 front and leave space on the back for the
9ae326a69004de David Howells 2009-04-03   62  	 *   encoder
9ae326a69004de David Howells 2009-04-03   63  	 */
22691addb04f46 David Howells 2019-10-31   64  	object->lookup_data->auxdata=
 =3D kmalloc((2 + 512) + 3, cachefiles_gfp);
22691addb04f46 David Howells 2019-10-31   65  	if (!object->lookup_data->au=
xdata)
22691addb04f46 David Howells 2019-10-31   66  		goto nomem_object;
9ae326a69004de David Howells 2009-04-03   67  =

402cb8dda949d9 David Howells 2018-04-04   68  	keylen =3D cookie->key_len;
402cb8dda949d9 David Howells 2018-04-04   69  	if (keylen <=3D sizeof(cooki=
e->inline_key))
402cb8dda949d9 David Howells 2018-04-04   70  		p =3D cookie->inline_key;
402cb8dda949d9 David Howells 2018-04-04   71  	else
402cb8dda949d9 David Howells 2018-04-04   72  		p =3D cookie->key;
22691addb04f46 David Howells 2019-10-31   73  =

22691addb04f46 David Howells 2019-10-31   74  	buffer =3D object->lookup_da=
ta->auxdata;
402cb8dda949d9 David Howells 2018-04-04   75  	memcpy(buffer + 2, p, keylen=
);
9ae326a69004de David Howells 2009-04-03   76  =

9ae326a69004de David Howells 2009-04-03   77  	*(uint16_t *)buffer =3D keyl=
en;
9ae326a69004de David Howells 2009-04-03   78  	((char *)buffer)[keylen + 2]=
 =3D 0;
9ae326a69004de David Howells 2009-04-03   79  	((char *)buffer)[keylen + 3]=
 =3D 0;
9ae326a69004de David Howells 2009-04-03   80  	((char *)buffer)[keylen + 4]=
 =3D 0;
9ae326a69004de David Howells 2009-04-03   81  =

9ae326a69004de David Howells 2009-04-03   82  	/* turn the raw key into som=
ething that can work with as a filename */
22691addb04f46 David Howells 2019-10-31   83  	object->lookup_data->key =3D=
 cachefiles_cook_key(buffer, keylen + 2, object->type);
22691addb04f46 David Howells 2019-10-31   84  	if (!object->lookup_data->ke=
y)
22691addb04f46 David Howells 2019-10-31   85  		goto nomem_object;
9ae326a69004de David Howells 2009-04-03   86  =

9ae326a69004de David Howells 2009-04-03   87  	/* get hold of the auxiliary=
 data and prepend the object type */
22691addb04f46 David Howells 2019-10-31   88  	auxdata =3D object->lookup_d=
ata->auxdata;
402cb8dda949d9 David Howells 2018-04-04   89  	auxlen =3D cookie->aux_len;
402cb8dda949d9 David Howells 2018-04-04   90  	if (auxlen) {
402cb8dda949d9 David Howells 2018-04-04   91  		if (auxlen <=3D sizeof(cook=
ie->inline_aux))
402cb8dda949d9 David Howells 2018-04-04   92  			p =3D cookie->inline_aux;
402cb8dda949d9 David Howells 2018-04-04   93  		else
402cb8dda949d9 David Howells 2018-04-04   94  			p =3D cookie->aux;
402cb8dda949d9 David Howells 2018-04-04   95  		memcpy(auxdata->data, p, au=
xlen);
9ae326a69004de David Howells 2009-04-03   96  	}
9ae326a69004de David Howells 2009-04-03   97  =

9ae326a69004de David Howells 2009-04-03   98  	auxdata->len =3D auxlen + 1;
402cb8dda949d9 David Howells 2018-04-04   99  	auxdata->type =3D cookie->ty=
pe;
9ae326a69004de David Howells 2009-04-03  100  =

9ae326a69004de David Howells 2009-04-03 @101  	_leave(" =3D %p [%p]", &obje=
ct->fscache, lookup_data);
                                                                           =
            ^^^^^^^^^^^

9ae326a69004de David Howells 2009-04-03  102  	return &object->fscache;
9ae326a69004de David Howells 2009-04-03  103  =

9ae326a69004de David Howells 2009-04-03  104  nomem_object:
22691addb04f46 David Howells 2019-10-31  105  	cachefiles_put_object(&objec=
t->fscache, fscache_obj_put_alloc_fail);
22691addb04f46 David Howells 2019-10-31  106  nomem:
9ae326a69004de David Howells 2009-04-03  107  	_leave(" =3D -ENOMEM");
9ae326a69004de David Howells 2009-04-03  108  	return ERR_PTR(-ENOMEM);
9ae326a69004de David Howells 2009-04-03  109  }
9ae326a69004de David Howells 2009-04-03  110  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============1584995775250119692==--

