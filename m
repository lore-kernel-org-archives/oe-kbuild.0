Content-Type: multipart/mixed; boundary="===============0561989197118133900=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH android-common] ANDROID: dma-buf: system_heap: pool_shrinker can be static
Date: Wed, 10 Feb 2021 11:21:57 +0800
Message-ID: <20210210032157.GA31041@e3136ff46986>
In-Reply-To: <202102101106.bBw5BMzc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0561989197118133900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 page_pool.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/page_pool.c b/drivers/dma-buf/heaps/page=
_pool.c
index 81d154cb0ae6a..b0b958228c242 100644
--- a/drivers/dma-buf/heaps/page_pool.c
+++ b/drivers/dma-buf/heaps/page_pool.c
@@ -232,14 +232,14 @@ static unsigned long dmabuf_page_pool_shrink_scan(str=
uct shrinker *shrinker,
 	return dmabuf_page_pool_shrink(sc->gfp_mask, sc->nr_to_scan);
 }
 =

-struct shrinker pool_shrinker =3D {
+static struct shrinker pool_shrinker =3D {
 	.count_objects =3D dmabuf_page_pool_shrink_count,
 	.scan_objects =3D dmabuf_page_pool_shrink_scan,
 	.seeks =3D DEFAULT_SEEKS,
 	.batch =3D 0,
 };
 =

-int dmabuf_page_pool_init_shrinker(void)
+static int dmabuf_page_pool_init_shrinker(void)
 {
 	return register_shrinker(&pool_shrinker);
 }
--===============0561989197118133900==--

