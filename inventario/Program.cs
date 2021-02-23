using System;
using System.Collections.Generic;

namespace inventario
{
    class Program
    {
        static void Main(string[] args)
        {
            do
            {
                ConnectionHandle con = new ConnectionHandle();
                string appOption = "";
                if(args.Length == 0)
                {
                    Console.WriteLine("Escribe la opción:\n- simple\n- normal\n- exit");
                    appOption = Console.ReadLine();
                    Console.WriteLine(args.Length);
                }

                if((args.Length > 0 && args[0] == "simple") || appOption == "simple")
                {
                    try
                    {
                        // "select * from categorias"
                        string query = "";
                        string value = "";

                        if(args.Length > 0)
                        {
                            query = args[1];
                            value = args[2];
                        } else
                        {
                            Console.WriteLine("Escribe una consulta SQL");
                            query = Console.ReadLine();
                            Console.WriteLine("Escribe la columna por obtener");
                            value = Console.ReadLine();
                            // if(String.IsNullOrEmpty(value.Trim())) value = "nombre";
                        }

                        List<string> values = con.ExecuteReader(query, value);
                        foreach (string item in values)
                        {
                            Console.WriteLine("{0}: {1}", value, item);
                        }
                        Console.WriteLine("\nCompleto");
                    }
                    catch (System.Exception)
                    {
                        
                        throw;
                    }
                } else if((args.Length > 0 && args[0] == "normal") || appOption == "normal")
                {
                    do
                    {
                        Console.WriteLine("Selecciona 1 para agregar a la DB, 2 para obtener los datos. \"c\" para salir");
                        string option = Console.ReadLine();
                        if(option.Trim() != "c")
                        {
                            if(option.Trim() == "1")
                            {
                                Console.WriteLine("1. Dispositivo\n2. Fabricante");
                                string insertOption = Console.ReadLine();
                                string query = "";
                                if(insertOption.Trim() == "1")
                                {
                                    Console.WriteLine("Nombre de dispositivo");
                                    string nombreDispositivo = Console.ReadLine().Trim();
                                    Console.WriteLine("ID de fabricante");
                                    string idFabricante = Console.ReadLine().Trim();
                                    Console.WriteLine("Fecha de lanzamiento");
                                    string fechaLanzamiento = Console.ReadLine().Trim();
                                    Console.WriteLine("ID de categoría");
                                    string idCategoria = Console.ReadLine().Trim();
                                    query = String.Format(
                                        "insert into dispositivos (nombre, fabricante, lanzamiento, categoria) values (\"{0}\", {1}, \"{2}\", {3})", 
                                        nombreDispositivo, idFabricante, fechaLanzamiento, idCategoria);
                                }
                                else if(insertOption.Trim() == "2")
                                {
                                    Console.WriteLine("Nombre de fabricante");
                                    string nombreFabricante = Console.ReadLine().Trim();
                                    query = String.Format("insert into fabricante (nombre) values (\"{0}\")", nombreFabricante);
                                }

                                if(!String.IsNullOrEmpty(query))
                                {
                                    Console.WriteLine(query);
                                    con.ExecuteQuery(query);
                                }
                            }
                            else if(option.Trim() == "2")
                            {
                                Console.WriteLine("1. Dispositivo\n2. Fabricante");
                                string insertOption = Console.ReadLine();
                                string query = "";
                                if(insertOption.Trim() == "1")
                                {
                                    query = "select * from fabricante";
                                }
                                else if(insertOption.Trim() == "2")
                                {
                                    query = "select * from dispositivos";
                                }

                                if(!String.IsNullOrEmpty(query))
                                {
                                    Console.WriteLine("Nombre de columna");
                                    string colVal = Console.ReadLine();
                                    if(String.IsNullOrEmpty(colVal.Trim())) colVal = "nombre";
                                    Console.WriteLine(query);
                                    var values = con.ExecuteReader(query, colVal);
                                    foreach (string item in values)
                                    {
                                        Console.WriteLine("{0}: {1}", colVal, item);
                                    }
                                    Console.WriteLine("\nCompleto");
                                }
                            }
                        } else break;
                    } while (true);
                } else if((args.Length > 0 && args[0] == "exit") || appOption == "exit")
                    break;
                else Console.WriteLine("Inválido");
            } while(true && args.Length == 0);
        }
    }
}
