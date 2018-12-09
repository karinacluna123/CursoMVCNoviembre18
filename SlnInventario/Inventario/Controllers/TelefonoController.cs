using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Inventario.Models;

namespace Inventario.Controllers
{
    public class TelefonoController : Controller
    {
        private dbInventarioEntitiesNuevo db = new dbInventarioEntitiesNuevo();

        // GET: Telefono
        public ActionResult Index()
        {
            var telefono = db.Telefono.Include(t => t.Telefono1).Include(t => t.Telefono2);
            return View(telefono.ToList());
        }

        // GET: Telefono/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telefono telefono = db.Telefono.Find(id);
            if (telefono == null)
            {
                return HttpNotFound();
            }
            return View(telefono);
        }

        // GET: Telefono/Create
        public ActionResult Create()
        {
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono");
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono");
            return View();
        }

        // POST: Telefono/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdTelefono,TelefonoCasa,TelefonoCelular")] Telefono telefono)
        {
            if (ModelState.IsValid)
            {
                db.Telefono.Add(telefono);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            return View(telefono);
        }

        // GET: Telefono/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telefono telefono = db.Telefono.Find(id);
            if (telefono == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            return View(telefono);
        }

        // POST: Telefono/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdTelefono,TelefonoCasa,TelefonoCelular")] Telefono telefono)
        {
            if (ModelState.IsValid)
            {
                db.Entry(telefono).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            ViewBag.IdTelefono = new SelectList(db.Telefono, "IdTelefono", "IdTelefono", telefono.IdTelefono);
            return View(telefono);
        }

        // GET: Telefono/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telefono telefono = db.Telefono.Find(id);
            if (telefono == null)
            {
                return HttpNotFound();
            }
            return View(telefono);
        }

        // POST: Telefono/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Telefono telefono = db.Telefono.Find(id);
            db.Telefono.Remove(telefono);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
