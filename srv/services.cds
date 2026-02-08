// renomeamos nosso namespace para MY para facilitar a escrita e informamos em qual
// pasta devemos procurar as entidades.
using { sap.capire.incidents as my } from '../db/schema';

// Criamos dois serviços. Um para o executor (Pode criar, alterar e apagar incidentes
// mas pode APENAS ver os clientes) e o ADM que pode fazer tudo.
// Com os comandos abaixo, criamos servicos OData que poderão ser usados.

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

/**
 * Service used by administrators to manage customers and incidents.
 */
service AdminService {
    entity Customers as projection on my.Customers;
    entity Incidents as projection on my.Incidents;
    }

// Habilitar CRUD para a entidade (Criar, Editar e Deletar)
annotate ProcessorService.Incidents with @odata.draft.enabled; 